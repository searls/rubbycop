# frozen_string_literal: true

describe RubbyCop::ConfigStore do
  subject(:config_store) { described_class.new }

  before do
    allow(RubbyCop::ConfigLoader).to receive(:configuration_file_for) do |arg|
      # File tree:
      # file1
      # dir/.rubbycop.yml
      # dir/file2
      # dir/subdir/file3
      (arg =~ /dir/ ? 'dir' : '.') + '/.rubbycop.yml'
    end
    allow(RubbyCop::ConfigLoader)
      .to receive(:configuration_from_file) { |arg| arg }
    allow(RubbyCop::ConfigLoader)
      .to receive(:load_file) { |arg| RubbyCop::Config.new(arg) }
    allow(RubbyCop::ConfigLoader)
      .to receive(:merge_with_default) { |config| "merged #{config.to_h}" }
    allow(RubbyCop::ConfigLoader)
      .to receive(:default_configuration) { 'default config' }
  end

  describe '.for' do
    it 'always uses config specified in command line' do
      config_store.options_config = { options_config: true }
      expect(config_store.for('file1')).to eq('merged {:options_config=>true}')
    end

    context 'when no config specified in command line' do
      it 'gets config path and config from cache if available' do
        expect(RubbyCop::ConfigLoader)
          .to receive(:configuration_file_for).once.with('dir')
        expect(RubbyCop::ConfigLoader)
          .to receive(:configuration_file_for).once.with('dir/subdir')
        # The stub returns the same config path for dir and dir/subdir.
        expect(RubbyCop::ConfigLoader)
          .to receive(:configuration_from_file).once.with('dir/.rubbycop.yml')

        config_store.for('dir/file2')
        config_store.for('dir/file2')
        config_store.for('dir/subdir/file3')
      end

      it 'searches for config path if not available in cache' do
        expect(RubbyCop::ConfigLoader).to receive(:configuration_file_for).once
        expect(RubbyCop::ConfigLoader).to receive(:configuration_from_file).once
        config_store.for('file1')
      end

      context 'when --force-default-config option is specified' do
        it 'uses default config without searching for config path' do
          expect(RubbyCop::ConfigLoader).not_to receive(:configuration_file_for)
          expect(RubbyCop::ConfigLoader).not_to receive(:configuration_from_file)
          config_store.force_default_config!
          expect(config_store.for('file1')).to eq('default config')
        end
      end
    end
  end
end
