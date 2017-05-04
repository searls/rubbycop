# frozen_string_literal: true

require 'rake'
require 'rake/tasklib'

module RubbyCop
  # Provides a custom rake task.
  #
  # require 'rubbycop/rake_task'
  # RubbyCop::RakeTask.new
  class RakeTask < Rake::TaskLib
    attr_accessor :name
    attr_accessor :verbose
    attr_accessor :fail_on_error
    attr_accessor :patterns
    attr_accessor :formatters
    attr_accessor :requires
    attr_accessor :options

    def initialize(*args, &task_block)
      setup_ivars(args)

      desc 'Run RubbyCop' unless ::Rake.application.last_description

      task(name, *args) do |_, task_args|
        RakeFileUtils.send(:verbose, verbose) do
          yield(*[self, task_args].slice(0, task_block.arity)) if block_given?
          run_main_task(verbose)
        end
      end

      setup_subtasks(name, *args, &task_block)
    end

    def run_main_task(verbose)
      run_cli(verbose, full_options)
    end

    private

    def run_cli(verbose, options)
      # We lazy-load rubbycop so that the task doesn't dramatically impact the
      # load time of your Rakefile.
      require 'rubbycop'

      cli = CLI.new
      puts 'Running RubbyCop...' if verbose
      result = cli.run(options)
      abort('RubbyCop failed!') if result.nonzero? && fail_on_error
    end

    def full_options
      [].tap do |result|
        result.concat(formatters.map { |f| ['--format', f] }.flatten)
        result.concat(requires.map { |r| ['--require', r] }.flatten)
        result.concat(options.flatten)
        result.concat(patterns)
      end
    end

    def setup_ivars(args)
      # More lazy-loading to keep load time down.
      require 'rubbycop/options'

      @name = args.shift || :rubbycop
      @verbose = true
      @fail_on_error = true
      @patterns = []
      @requires = []
      @options = []
      @formatters = []
    end

    def setup_subtasks(name, *args, &task_block)
      namespace name do
        desc 'Auto-correct RubbyCop offenses'

        task(:auto_correct, *args) do |_, task_args|
          yield(*[self, task_args].slice(0, task_block.arity)) if block_given?
          options = full_options.unshift('--auto-correct')
          run_cli(verbose, options)
        end
      end
    end
  end
end
