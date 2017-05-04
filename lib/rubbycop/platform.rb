# frozen_string_literal: true

module RubbyCop
  # This module provides information on the platform that RubbyCop is being run
  # on.
  module Platform
    def self.windows?
      RUBY_PLATFORM =~ /cygwin|mswin|mingw|bccwin|wince|emx/
    end
  end
end
