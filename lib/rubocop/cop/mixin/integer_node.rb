# frozen_string_literal: true

module RubbyCop
  module Cop
    # Common functionality for checking integer nodes.
    module IntegerNode
      def integer_part(node)
        node.source.sub(/^[+-]/, '').split('.').first
      end
    end
  end
end
