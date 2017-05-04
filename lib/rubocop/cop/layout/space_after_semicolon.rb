# frozen_string_literal: true

module RubbyCop
  module Cop
    module Layout
      # Checks for semicolon (;) not followed by some kind of space.
      class SpaceAfterSemicolon < Cop
        include SpaceAfterPunctuation

        def space_style_before_rcurly
          cfg = config.for_cop('Layout/SpaceInsideBlockBraces')
          cfg['EnforcedStyle'] || 'space'
        end

        def kind(token)
          'semicolon' if token.type == :tSEMI
        end
      end
    end
  end
end
