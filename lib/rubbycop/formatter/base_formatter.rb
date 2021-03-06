# frozen_string_literal: true

# rubbycop:disable Metrics/LineLength

module RubbyCop
  module Formatter
    # Abstract base class for formatter, implements all public API methods.
    #
    # ## Creating Custom Formatter
    #
    # You can create a custom formatter by subclassing
    # `RubbyCop::Formatter::BaseFormatter` and overriding some methods,
    # or by implementing all the methods by duck typing.
    #
    # ## Using Custom Formatter in Command Line
    #
    # You can tell RubbyCop to use your custom formatter with a combination of
    # `--format` and `--require` option.
    # For example, when you have defined `MyCustomFormatter` in
    # `./path/to/my_custom_formatter.rb`, you would type this command:
    #
    #     rubbycop --require ./path/to/my_custom_formatter --format MyCustomFormatter
    #
    # Note: The path passed to `--require` is directly passed to
    # `Kernel.require`.
    # If your custom formatter file is not in `$LOAD_PATH`,
    # you need to specify the path as relative path prefixed with `./`
    # explicitly, or absolute path.
    #
    # ## Method Invocation Order
    #
    # For example, when RubbyCop inspects 2 files,
    # the invocation order should be like this:
    #
    # * `#initialize`
    # * `#started`
    # * `#file_started`
    # * `#file_finished`
    # * `#file_started`
    # * `#file_finished`
    # * `#finished`
    #
    class BaseFormatter
      # rubbycop:enable Metrics/LineLength

      # @api public
      #
      # @!attribute [r] output
      #
      # @return [IO]
      #   the IO object passed to `#initialize`
      #
      # @see #initialize
      attr_reader :output

      # @api public
      #
      # @!attribute [r] options
      #
      # @return [Hash]
      attr_reader :options

      # @api public
      #
      # @param output [IO]
      #   `$stdout` or opened file
      def initialize(output, options = {})
        @output = output
        @options = options
      end

      # @api public
      #
      # Invoked once before any files are inspected.
      #
      # @param target_files [Array(String)]
      #   all target file paths to be inspected
      #
      # @return [void]
      def started(target_files); end

      # @api public
      #
      # Invoked at the beginning of inspecting each files.
      #
      # @param file [String]
      #   the file path
      #
      # @param options [Hash]
      #   file specific information, currently this is always empty.
      #
      # @return [void]
      def file_started(file, options); end

      # @api public
      #
      # Invoked at the end of inspecting each files.
      #
      # @param file [String]
      #   the file path
      #
      # @param offenses [Array(RubbyCop::Cop::Offense)]
      #   all detected offenses for the file
      #
      # @return [void]
      #
      # @see RubbyCop::Cop::Offense
      def file_finished(file, offenses); end

      # @api public
      #
      # Invoked after all files are inspected, or interrupted by user.
      #
      # @param inspected_files [Array(String)]
      #   the inspected file paths.
      #   This would be same as `target_files` passed to `#started`
      #   unless RubbyCop is interrupted by user.
      #
      # @return [void]
      def finished(inspected_files); end
    end
  end
end
