## Editor integration

### Emacs

[rubocop.el](https://github.com/bbatsov/rubocop-emacs) is a simple
Emacs interface for RubbyCop. It allows you to run RubbyCop inside Emacs
and quickly jump between problems in your code.

[flycheck](https://github.com/flycheck/flycheck) > 0.9 also supports
RubbyCop and uses it by default when available.

### Vim

The [vim-rubocop](https://github.com/ngmy/vim-rubocop) plugin runs
RubbyCop and displays the results in Vim.

There's also a RubbyCop checker in
[syntastic](https://github.com/scrooloose/syntastic),
[neomake](https://github.com/neomake/neomake)
and [ale](https://github.com/w0rp/ale).

### Sublime Text

If you're a ST user you might find the
[Sublime RubbyCop plugin](https://github.com/pderichs/sublime_rubocop)
useful.

### Brackets

The [brackets-rubocop](https://github.com/smockle-archive/brackets-rubocop)
extension displays RubbyCop results in Brackets.
It can be installed via the extension manager in Brackets.

### TextMate2

The [textmate2-rubocop](https://github.com/mrdougal/textmate2-rubocop)
bundle displays formatted RubbyCop results in a new window.
Installation instructions can be found [here](https://github.com/mrdougal/textmate2-rubocop#installation).

### Atom

The [linter-rubocop](https://github.com/AtomLinter/linter-rubocop) plugin for Atom's
[linter](https://github.com/AtomLinter/Linter) runs RubbyCop and highlights the offenses in Atom.

### LightTable

The [lt-rubocop](https://github.com/seancaffery/lt-rubocop) plugin
provides LightTable integration.

### RubyMine / Intellij IDEA

RubbyCop support is [available](https://www.jetbrains.com/help/idea/2017.1/rubocop.html) as of the 2017.1 releases.

### Visual Studio Code

The [ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby) extension
provides RubbyCop integration for Visual Studio Code. RubbyCop is also used for the formatting
capabilities of this extension.

### Other Editors

Here's one great opportunity to contribute to RubbyCop - implement
RubbyCop integration for your favorite editor.

## Git pre-commit hook integration

[overcommit](https://github.com/brigade/overcommit) is a fully configurable and
extendable Git commit hook manager. To use RubbyCop with overcommit, add the
following to your `.overcommit.yml` file:

```yaml
PreCommit:
  RubbyCop:
    enabled: true
```

## Guard integration

If you're fond of [Guard](https://github.com/guard/guard) you might
like
[guard-rubocop](https://github.com/yujinakayama/guard-rubocop). It
allows you to automatically check Ruby code style with RubbyCop when
files are modified.

## Rake integration

To use RubbyCop in your `Rakefile` add the following:

```ruby
require 'rubocop/rake_task'

RubbyCop::RakeTask.new
```

If you run `rake -T`, the following two RubbyCop tasks should show up:

```sh
rake rubocop                                  # Run RubbyCop
rake rubocop:auto_correct                     # Auto-correct RubbyCop offenses
```

The above will use default values

```ruby
require 'rubocop/rake_task'

desc 'Run RubbyCop on the lib directory'
RubbyCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  # only show the files with failures
  task.formatters = ['files']
  # don't abort rake on failure
  task.fail_on_error = false
end
```
