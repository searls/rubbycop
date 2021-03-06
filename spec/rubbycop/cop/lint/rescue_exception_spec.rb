# frozen_string_literal: true

describe RubbyCop::Cop::Lint::RescueException do
  subject(:cop) { described_class.new }

  it 'registers an offense for rescue from Exception' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
      rescue Exception
        #do nothing
      end
    END
    expect(cop.offenses.size).to eq(1)
  end

  it 'registers an offense for rescue with ::Exception' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
      rescue ::Exception
        #do nothing
      end
    END
    expect(cop.offenses.size).to eq(1)
  end

  it 'registers an offense for rescue with StandardError, Exception' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
      rescue StandardError, Exception
        #do nothing
      end
    END
    expect(cop.offenses.size).to eq(1)
  end

  it 'registers an offense for rescue with Exception => e' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
      rescue Exception => e
        #do nothing
      end
    END
    expect(cop.offenses.size).to eq(1)
  end

  it 'does not register an offense for rescue with no class' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
        return
      rescue
        file.close
      end
    END
    expect(cop.offenses).to be_empty
  end

  it 'does not register an offense for rescue with no class and => e' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
        return
      rescue => e
        file.close
      end
    END
    expect(cop.offenses).to be_empty
  end

  it 'does not register an offense for rescue with other class' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
        return
      rescue ArgumentError => e
        file.close
      end
    END
    expect(cop.offenses).to be_empty
  end

  it 'does not register an offense for rescue with other classes' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
        return
      rescue EOFError, ArgumentError => e
        file.close
      end
    END
    expect(cop.offenses).to be_empty
  end

  it 'does not register an offense for rescue with a module prefix' do
    inspect_source(cop, <<-END.strip_indent)
      begin
        something
        return
      rescue Test::Exception => e
        file.close
      end
    END
    expect(cop.offenses).to be_empty
  end

  it 'does not crash when the splat operator is used in a rescue' do
    inspect_source(cop, <<-END.strip_indent)
      ERRORS = [Exception]
      begin
        a = 3 / 0
      rescue *ERRORS
        puts e
      end
    END
    expect(cop.offenses).to be_empty
  end

  it 'does not crash when the namespace of a rescued class is in a local ' \
     'variable' do
    inspect_source(cop, <<-END.strip_indent)
      adapter = current_adapter
      begin
      rescue adapter::ParseError
      end
    END
    expect(cop.offenses).to be_empty
  end
end
