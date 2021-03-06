# frozen_string_literal: true

module RubbyCop
  module Cop
    module Style
      # This cop checks for `raise` or `fail` statements which do not specify an
      # explicit exception class. (This raises a `RuntimeError`. Some projects
      # might prefer to use exception classes which more precisely identify the
      # nature of the error.)
      #
      # @example
      #   @bad
      #   raise 'Error message here'
      #
      #   @good
      #   raise ArgumentError, 'Error message here'
      class ImplicitRuntimeError < Cop
        def_node_matcher :implicit_runtime_error_raise_or_fail,
                         '(send nil ${:raise :fail} {str dstr})'

        def on_send(node)
          implicit_runtime_error_raise_or_fail(node) do |method|
            add_offense(node, :expression, "Use `#{method}` with an explicit " \
                                           'exception class and message, ' \
                                           'rather than just a message.')
          end
        end
      end
    end
  end
end
