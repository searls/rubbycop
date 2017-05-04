# frozen_string_literal: true

module RubbyCop
  # A Warning exception is different from an Offense with severity 'warning'
  # When a Warning is raised, this means that RubbyCop was unable to perform a
  # requested operation (such as inspecting or correcting a source file) due to
  # user error
  # For example, a configuration value in .rubbycop.yml might be malformed
  class Warning < StandardError
  end
end
