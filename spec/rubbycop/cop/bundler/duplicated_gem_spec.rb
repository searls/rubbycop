# frozen_string_literal: true

describe RubbyCop::Cop::Bundler::DuplicatedGem, :config do
  let(:cop_config) { { 'Include' => ['**/Gemfile'] } }
  subject(:cop) { described_class.new(config) }

  context 'when investigating Ruby files' do
    let(:source) { <<-END }
      # cop will not read these contents
      gem('rubbycop')
      gem('rubbycop')
    END

    it 'does not register any offenses' do
      inspect_source_file(cop, source)
      expect(cop.offenses).to be_empty
    end
  end

  context 'when investigating Gemfiles' do
    context 'and the file is empty' do
      let(:source) { '' }

      it 'does not raise an error' do
        expect { inspect_source(cop, source, 'gems.rb') }.not_to raise_error
      end

      it 'does not register any offenses' do
        expect(cop.offenses).to be_empty
      end
    end

    context 'and no duplicate gems are present' do
      let(:source) { <<-GEM }
        gem 'rubbycop'
        gem 'flog'
      GEM

      it 'does not register any offenses' do
        inspect_gemfile(cop, source)
        expect(cop.offenses).to be_empty
      end
    end

    context 'and a gem is duplicated in default group' do
      let(:source) { <<-GEM }
        source 'https://rubygems.org'
        gem 'rubbycop'
        gem 'rubbycop'
      GEM

      it 'registers an offense' do
        inspect_gemfile(cop, source)
        expect(cop.offenses.size).to eq(1)
      end

      it "references gem's first occurance in message" do
        inspect_gemfile(cop, source)
        expect(cop.offenses.first.message).to include('2')
      end

      it 'highlights the duplicate gem' do
        inspect_gemfile(cop, source)
        expect(cop.highlights).to eq(["gem 'rubbycop'"])
      end
    end

    context 'and a duplicated gem is in a git/path/group/platforms block' do
      let(:source) { <<-GEM }
        gem 'rubbycop'
        group :development do
          gem 'rubbycop', path: '/path/to/gem'
        end
      GEM

      it 'registers an offense' do
        inspect_gemfile(cop, source)
        expect(cop.offenses.size).to eq(1)
      end

      it 'highlights the duplicate gem' do
        inspect_gemfile(cop, source)
        expect(cop.highlights).to eq(["gem 'rubbycop', path: '/path/to/gem'"])
      end
    end
  end
end
