# frozen_string_literal: true

module RubbyCop
  module Cop
    # Common functionality for checking target ruby version.
    module TargetRubyVersion
      def minimum_target_ruby_version(version)
        @minimum_target_ruby_version = version
      end

      def support_target_ruby_version?(version)
        @minimum_target_ruby_version <= version
      end
    end
  end
end
