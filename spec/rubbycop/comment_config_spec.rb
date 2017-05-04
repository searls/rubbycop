# frozen_string_literal: true

describe RubbyCop::CommentConfig do
  subject(:comment_config) { described_class.new(parse_source(source)) }

  describe '#cop_enabled_at_line?' do
    let(:source) do
      [
        '# rubbycop:disable Metrics/MethodLength with a comment why',
        'def some_method',
        "  puts 'foo'",                                      # 3
        'end',
        '# rubbycop:enable Metrics/MethodLength',
        '',
        '# rubbycop:disable all',
        'some_method',                                       # 8
        '# rubbycop:enable all',
        '',
        "code = 'This is evil.'",
        'eval(code) # rubbycop:disable Security/Eval',
        "puts 'This is not evil.'",                          # 12
        '',
        'def some_method',
        "  puts 'Disabling indented single line' # rubbycop:disable " \
        'Metrics/LineLength',
        'end',
        '',                                                  # 18
        'string = <<END',
        'This is a string not a real comment # rubbycop:disable Style/Loop',
        'END',
        '',
        'foo # rubbycop:disable Style/MethodCallWithoutArgsParentheses', # 23
        '',
        '# rubbycop:enable Lint/Void',
        '',
        '# rubbycop:disable Style/For, Style/Not,Layout/Tab',
        'foo',                                               # 28
        '',
        'class One',
        '  # rubbycop:disable Style/ClassVars',
        '  @@class_var = 1',
        'end',                                               # 33
        '',
        'class Two',
        '  # rubbycop:disable Style/ClassVars',
        '  @@class_var = 2',
        'end',                                               # 38
        '# rubbycop:enable Style/Not,Layout/Tab',
        '# rubbycop:disable Style/Send, Lint/RandOne some comment why',
        '# rubbycop:disable Lint/BlockAlignment some comment why',
        '# rubbycop:enable Style/Send, Lint/BlockAlignment but why?',
        '# rubbycop:enable Lint/RandOne foo bar!',            # 43
        '# rubbycop:disable FlatMap',
        '[1, 2, 3, 4].map { |e| [e, e] }.flatten(1)',
        '# rubbycop:enable FlatMap',
        '# rubbycop:disable RSpec/Example',
        '# rubbycop:disable Custom2/Number9'                  # 48
      ]
    end

    def disabled_lines_of_cop(cop)
      (1..source.size).each_with_object([]) do |line_number, disabled_lines|
        enabled = comment_config.cop_enabled_at_line?(cop, line_number)
        disabled_lines << line_number unless enabled
      end
    end

    it 'supports disabling multiple lines with a pair of directive' do
      method_length_disabled_lines =
        disabled_lines_of_cop('Metrics/MethodLength')
      expected_part = (1..4).to_a
      expect(method_length_disabled_lines & expected_part).to eq(expected_part)
    end

    it 'supports enabling/disabling multiple cops in a single directive' do
      not_disabled_lines = disabled_lines_of_cop('Style/Not')
      tab_disabled_lines = disabled_lines_of_cop('Layout/Tab')

      expect(not_disabled_lines).to eq(tab_disabled_lines)
      expected_part = (27..39).to_a
      expect(not_disabled_lines & expected_part).to eq(expected_part)
    end

    it 'supports enabling/disabling multiple cops along with a comment' do
      {
        'Style/Send' => 40..42,
        'Lint/RandOne' => 40..43,
        'Lint/BlockAlignment' => 41..42
      }.each do |cop_name, expected|
        actual = disabled_lines_of_cop(cop_name)
        expect(actual & expected.to_a).to eq(expected.to_a)
      end
    end

    it 'supports enabling/disabling cops without a prefix' do
      flat_map_disabled_lines = disabled_lines_of_cop('Performance/FlatMap')

      expected = (44..46).to_a

      expect(flat_map_disabled_lines & expected).to eq(expected)
    end

    it 'supports disabling all lines after a directive' do
      for_disabled_lines = disabled_lines_of_cop('Style/For')
      expected_part = (27..source.size).to_a
      expect(for_disabled_lines & expected_part).to eq(expected_part)
    end

    it 'just ignores unpaired enabling directives' do
      void_disabled_lines = disabled_lines_of_cop('Lint/Void')
      expected_part = (25..source.size).to_a
      expect(void_disabled_lines & expected_part).to be_empty
    end

    it 'supports disabling single line with a directive at end of line' do
      eval_disabled_lines = disabled_lines_of_cop('Security/Eval')
      expect(eval_disabled_lines).to include(12)
      expect(eval_disabled_lines).not_to include(13)
    end

    it 'handles indented single line' do
      line_length_disabled_lines = disabled_lines_of_cop('Metrics/LineLength')
      expect(line_length_disabled_lines).to include(16)
      expect(line_length_disabled_lines).not_to include(18)
    end

    it 'does not confuse a comment directive embedded in a string literal ' \
       'with a real comment' do
      loop_disabled_lines = disabled_lines_of_cop('Loop')
      expect(loop_disabled_lines).not_to include(20)
    end

    it 'supports disabling all cops except Lint/UnneededDisable with ' \
       'keyword all' do
      expected_part = (7..8).to_a

      cops = RubbyCop::Cop::Cop.all.reject do |klass|
        klass == RubbyCop::Cop::Lint::UnneededDisable
      end

      cops.each do |cop|
        disabled_lines = disabled_lines_of_cop(cop)
        expect(disabled_lines & expected_part).to eq(expected_part)
      end
    end

    it 'does not confuse a cop name including "all" with all cops' do
      alias_disabled_lines = disabled_lines_of_cop('Alias')
      expect(alias_disabled_lines).not_to include(23)
    end

    it 'can handle double disable of one cop' do
      expect(disabled_lines_of_cop('Style/ClassVars'))
        .to eq([7, 8, 9] + (31..source.size).to_a)
    end

    it 'supports disabling cops with multiple uppercase letters' do
      expect(disabled_lines_of_cop('RSpec/Example')).to include(47)
    end

    it 'supports disabling cops with numbers in their name' do
      expect(disabled_lines_of_cop('Custom2/Number9')).to include(48)
    end
  end
end
