# frozen_string_literal: true

module RubbyCop
  module Cop
    module Security
      # This cop checks for the use of `Kernel#eval` and `Binding#eval`.
      #
      # @example
      #
      #   # bad
      #
      #   eval(something)
      #   binding.eval(something)
      class Eval < Cop
        MSG = 'The use of `eval` is a serious security risk.'.freeze

        def_node_matcher :eval?, <<-END
          (send {nil (send nil :binding)} :eval $!str ...)
        END

        def on_send(node)
          eval?(node) do |code|
            return if code.dstr_type? && code.recursive_literal?
            add_offense(node, :selector)
          end
        end
      end
    end
  end
end
