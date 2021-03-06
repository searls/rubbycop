# frozen_string_literal: true

module RubbyCop
  # This module holds the RubbyCop version information.
  module Version
    STRING = '0.49.0'.freeze

    MSG = '%s (using Parser %s, running on %s %s %s)'.freeze

    def self.version(debug = false)
      if debug
        format(MSG, STRING, Parser::VERSION,
               RUBY_ENGINE, RUBY_VERSION, RUBY_PLATFORM)
      else
        STRING
      end
    end
  end
end
