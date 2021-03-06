# frozen_string_literal: true

module RubbyCop
  module Cop
    module Style
      # Use `next` to skip iteration instead of a condition at the end.
      #
      # @example
      #   # bad
      #   [1, 2].each do |a|
      #     if a == 1
      #       puts a
      #     end
      #   end
      #
      #   # good
      #   [1, 2].each do |a|
      #     next unless a == 1
      #     puts a
      #   end
      class Next < Cop
        include ConfigurableEnforcedStyle
        include MinBodyLength

        MSG = 'Use `next` to skip iteration.'.freeze
        EXIT_TYPES = %i[break return].freeze
        EACH_ = 'each_'.freeze
        ENUMERATORS = %i[collect collect_concat detect downto each
                         find find_all find_index inject loop map!
                         map reduce reject reject! reverse_each select
                         select! times upto].freeze

        def investigate(_processed_source)
          # When correcting nested offenses, we need to keep track of how much
          # we have adjusted the indentation of each line
          @reindented_lines = Hash.new(0)
        end

        def on_block(node)
          block_owner, _, body = *node
          return unless block_owner.send_type?
          return unless body && ends_with_condition?(body)

          _, method_name = *block_owner
          return unless enumerator?(method_name)

          offense_node = offense_node(body)
          add_offense(offense_node, offense_location(offense_node), MSG)
        end

        def on_while(node)
          return unless node.body && ends_with_condition?(node.body)

          offending_node = offense_node(node.body)

          add_offense(offending_node, offense_location(offending_node), MSG)
        end
        alias on_until on_while
        alias on_for on_while

        private

        def enumerator?(method_name)
          ENUMERATORS.include?(method_name) ||
            method_name.to_s.start_with?(EACH_)
        end

        def ends_with_condition?(body)
          return true if simple_if_without_break?(body)

          body.begin_type? && simple_if_without_break?(body.children.last)
        end

        def simple_if_without_break?(node)
          return false unless if_without_else?(node)
          return false if if_else_children?(node)
          return false if allowed_modifier_if?(node)

          !exit_body_type?(node)
        end

        def allowed_modifier_if?(node)
          if node.modifier_form?
            style == :skip_modifier_ifs
          else
            !min_body_length?(node)
          end
        end

        def if_else_children?(node)
          node.each_child_node(:if).any?(&:else?)
        end

        def if_without_else?(node)
          node && node.if_type? && !node.ternary? && !node.else?
        end

        def exit_body_type?(node)
          return false unless node.if_branch

          EXIT_TYPES.include?(node.if_branch.type)
        end

        def offense_node(body)
          *_, condition = *body
          condition && condition.if_type? ? condition : body
        end

        def offense_location(offense_node)
          condition_expression, = *offense_node
          offense_begin_pos = offense_node.source_range.begin
          offense_begin_pos.join(condition_expression.source_range)
        end

        def autocorrect(node)
          lambda do |corrector|
            if node.modifier_form?
              autocorrect_modifier(corrector, node)
            else
              autocorrect_block(corrector, node)
            end
          end
        end

        def autocorrect_modifier(corrector, node)
          cond, if_body, else_body = *node
          body = if_body || else_body

          replacement = "next #{opposite_kw(if_body)} #{cond.source}\n" \
                        "#{' ' * node.source_range.column}#{body.source}"

          corrector.replace(node.source_range, replacement)
        end

        def autocorrect_block(corrector, node)
          cond, if_body, = *node

          next_code = "next #{opposite_kw(if_body)} #{cond.source}"
          corrector.insert_before(node.source_range, next_code)

          corrector.remove(cond_range(node, cond))
          corrector.remove(end_range(node))

          lines = reindentable_lines(node)
          return if lines.empty?

          reindent(lines, cond, corrector)
        end

        def opposite_kw(if_body)
          if_body.nil? ? 'if' : 'unless'
        end

        def cond_range(node, cond)
          end_pos = if node.loc.begin
                      node.loc.begin.end_pos # after "then"
                    else
                      cond.source_range.end_pos
                    end

          range_between(node.source_range.begin_pos, end_pos)
        end

        def end_range(node)
          source_buffer = node.source_range.source_buffer
          end_pos = node.loc.end.end_pos
          begin_pos = node.loc.end.begin_pos - node.source_range.column
          begin_pos -= 1 if end_followed_by_whitespace_only?(source_buffer,
                                                             end_pos)

          range_between(begin_pos, end_pos)
        end

        def end_followed_by_whitespace_only?(source_buffer, end_pos)
          source_buffer.source[end_pos..-1] =~ /\A\s*$/
        end

        def reindentable_lines(node)
          buffer = node.source_range.source_buffer

          # end_range starts with the final newline of the if body
          lines = (node.source_range.line + 1)...node.loc.end.line
          lines = lines.to_a - heredoc_lines(node)
          # Skip blank lines
          lines.reject { |lineno| buffer.source_line(lineno) =~ /\A\s*\z/ }
        end

        # Adjust indentation of `lines` to match `node`
        def reindent(lines, node, corrector)
          range  = node.source_range
          buffer = range.source_buffer

          target_indent = range.source_line =~ /\S/
          delta = actual_indent(lines, buffer) - target_indent
          lines.each do |lineno|
            reindent_line(corrector, lineno, delta, buffer)
          end
        end

        def actual_indent(lines, buffer)
          lines.map { |lineno| buffer.source_line(lineno) =~ /\S/ }.min
        end

        def heredoc_lines(node)
          node.each_node(:dstr)
              .select { |n| n.loc.respond_to?(:heredoc_body) }
              .map { |n| n.loc.heredoc_body }
              .flat_map { |b| (b.line...b.last_line).to_a }
        end

        def reindent_line(corrector, lineno, delta, buffer)
          adjustment = delta + @reindented_lines[lineno]
          @reindented_lines[lineno] = adjustment

          if adjustment > 0
            corrector.remove_leading(buffer.line_range(lineno), adjustment)
          elsif adjustment < 0
            corrector.insert_before(buffer.line_range(lineno),
                                    ' ' * -adjustment)
          end
        end
      end
    end
  end
end
