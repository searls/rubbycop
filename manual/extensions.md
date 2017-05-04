## Extensions

It's possible to extend RubbyCop with custom cops and formatters.

### Loading Extensions

Besides the `--require` command line option you can also specify ruby
files that should be loaded with the optional `require` directive in the
`.rubbycop.yml` file:

```yaml
require:
 - ../my/custom/file.rb
 - rubbycop-extension
```

Note: The paths are directly passed to `Kernel.require`.  If your
extension file is not in `$LOAD_PATH`, you need to specify the path as
relative path prefixed with `./` explicitly, or absolute path. Paths
starting with a `.` are resolved relative to `.rubbycop.yml`.

### Custom Cops

You can configure the custom cops in your `.rubbycop.yml` just like any
other cop.

#### Known Custom Cops

* [rubbycop-rspec](https://github.com/nevir/rubbycop-rspec) -
  RSpec-specific analysis
* [rubbycop-cask](https://github.com/caskroom/rubbycop-cask) - Analysis
  for Homebrew-Cask files.
* [rubbycop-thread_safety](https://github.com/covermymeds/rubbycop-thread_safety) -
  Thread-safety analysis

### Custom Formatters

You can customize RubbyCop's output format with custom formatters.

#### Creating a Custom Formatter

To implement a custom formatter, you need to subclass
`RubbyCop::Formatter::BaseFormatter` and override some methods,
or implement all formatter API methods by duck typing.

Please see the documents below for more formatter API details.

* [RubbyCop::Formatter::BaseFormatter](http://www.rubydoc.info/gems/rubbycop/RubbyCop/Formatter/BaseFormatter)
* [RubbyCop::Cop::Offense](http://www.rubydoc.info/gems/rubbycop/RubbyCop/Cop/Offense)
* [Parser::Source::Range](http://www.rubydoc.info/github/whitequark/parser/Parser/Source/Range)

#### Using a Custom Formatter from the Command Line

You can tell RubbyCop to use your custom formatter with a combination of
`--format` and `--require` option.
For example, when you have defined `MyCustomFormatter` in
`./path/to/my_custom_formatter.rb`, you would type this command:

```sh
$ rubbycop --require ./path/to/my_custom_formatter --format MyCustomFormatter
```
