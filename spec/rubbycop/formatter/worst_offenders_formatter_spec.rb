# frozen_string_literal: true

module RubbyCop
  module Formatter
    describe WorstOffendersFormatter do
      subject(:formatter) { described_class.new(output) }
      let(:output) { StringIO.new }

      let(:files) do
        %w[lib/rubbycop.rb spec/spec_helper.rb bin/rubbycop].map do |path|
          File.expand_path(path)
        end
      end

      describe '#finished' do
        context 'when there are many offenses' do
          let(:offense) { double('offense') }

          before do
            formatter.started(files)
            files.each_with_index do |file, index|
              formatter.file_finished(file, [offense] * (index + 2))
            end
          end

          it 'sorts by offense count first and then by cop name' do
            formatter.finished(files)
            expect(output.string).to eq(<<-END.strip_indent)

              4  bin/rubbycop
              3  spec/spec_helper.rb
              2  lib/rubbycop.rb
              --
              9  Total

            END
          end
        end
      end
    end
  end
end
