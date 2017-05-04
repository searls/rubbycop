# frozen_string_literal: true

module RubbyCop
  module Cop
    module Bundler
      # A Gem's requirements should be listed only once in a Gemfile.
      # @example
      #   # bad
      #   gem 'rubbycop'
      #   gem 'rubbycop'
      #
      #   # bad
      #   group :development do
      #     gem 'rubbycop'
      #   end
      #
      #   group :test do
      #     gem 'rubbycop'
      #   end
      #
      #   # good
      #   group :development, :test do
      #     gem 'rubbycop'
      #   end
      #
      #   # good
      #   gem 'rubbycop', groups: [:development, :test]
      class DuplicatedGem < Cop
        MSG = 'Gem `%s` requirements already given on line %d ' \
              'of the Gemfile.'.freeze

        def investigate(processed_source)
          return unless processed_source.ast

          duplicated_gem_nodes.each do |nodes|
            nodes[1..-1].each do |node|
              register_offense(
                node,
                node.method_args.first.to_a.first,
                nodes.first.loc.line
              )
            end
          end
        end

        private

        def_node_search :gem_declarations, '(send nil :gem str ...)'

        def duplicated_gem_nodes
          gem_declarations(processed_source.ast)
            .group_by { |e| e.method_args.first }
            .keep_if { |_, nodes| nodes.length > 1 }
            .values
        end

        def register_offense(node, gem_name, line_of_first_occurrence)
          line_range = node.loc.column...node.loc.last_column

          add_offense(
            node,
            source_range(processed_source.buffer, node.loc.line, line_range),
            format(MSG, gem_name, line_of_first_occurrence)
          )
        end
      end
    end
  end
end
