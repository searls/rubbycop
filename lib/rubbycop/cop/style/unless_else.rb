# frozen_string_literal: true

module RubbyCop
  module Cop
    module Style
      # This cop looks for *unless* expressions with *else* clauses.
      class UnlessElse < Cop
        MSG = 'Do not use `unless` with `else`. Rewrite these with the ' \
              'positive case first.'.freeze

        def on_if(node)
          return unless node.unless? && node.else?

          add_offense(node, :expression)
        end

        def autocorrect(node)
          condition, = *node
          body_range = range_between_condition_and_else(node, condition)
          else_range = range_between_else_and_end(node)

          lambda do |corrector|
            corrector.replace(node.loc.keyword, 'if'.freeze)
            corrector.replace(body_range, else_range.source)
            corrector.replace(else_range, body_range.source)
          end
        end

        def range_between_condition_and_else(node, condition)
          range_between(condition.source_range.end_pos, node.loc.else.begin_pos)
        end

        def range_between_else_and_end(node)
          range_between(node.loc.else.end_pos, node.loc.end.begin_pos)
        end
      end
    end
  end
end