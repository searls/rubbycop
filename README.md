[![Gem Version](https://badge.fury.io/rb/rubbycop.svg)](http://badge.fury.io/rb/rubbycop)
[![Dependency Status](https://gemnasium.com/searls/rubbycop.svg)](https://gemnasium.com/searls/rubbycop)
[![Build Status](https://travis-ci.org/searls/rubbycop.svg?branch=master)](https://travis-ci.org/searls/rubbycop)
[![Coverage Status](https://img.shields.io/codeclimate/coverage/github/searls/rubbycop.svg)](https://codeclimate.com/github/searls/rubbycop)
[![Code Climate](https://codeclimate.com/github/searls/rubbycop/badges/gpa.svg)](https://codeclimate.com/github/searls/rubbycop)
[![Inline docs](http://inch-ci.org/github/searls/rubbycop.svg)](http://inch-ci.org/github/searls/rubbycop)

<p align="center">
  <img src="https://raw.githubusercontent.com/searls/rubbycop/master/logo/rubby-logo-horizontal.png" alt="RubbyCop Logo"/>
</p>

RubbyCop is a fork of [RuboCop](https://github.com/bbatsov/rubocop) that hopes
to be what [standard.js](https://github.com/feross/standard) is to
[eslint](https://github.com/eslint/eslint)—an unconfigurable linter that takes
the arbitrary style decisions out of your team's hands so everyone can shut up
and get to work.

RubbyCop will also be changing the default styles to emphasize consistency and
minimalism, in an attempt to dramatically reduce the number of times developers
even have to think about their code style in comparison to the RuboCop defaults.

## Installation

**RubbyCop**'s installation is pretty standard:

```sh
$ gem install rubbycop
```

If you'd rather install RubbyCop using `bundler`, don't require it in your `Gemfile`:

```rb
gem 'rubbycop', require: false
```

## Quickstart

Just type `rubbycop` in a Ruby project's folder and watch the magic happen.

```
$ cd my/cool/ruby/project
$ rubbycop
```

## Compatibility

RubbyCop supports the following Ruby implementations:

* MRI 2.0
* MRI 2.1
* MRI 2.2
* MRI 2.3
* MRI 2.4
* JRuby 9.0+
* Rubinius 2.0+

## Logo

RuboCop's logo was originally created by [Dimiter
Petrov](https://www.chadomoto.com/).  To disambiguate this project from
RuboCop, wechanged it. You can find the logo in various
formats [here](https://github.com/searls/rubbycop/tree/master/logo).

The logo is licensed under a
[Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/deed.en_GB).

## Copyright

Copyright (c) 2012-2017 Bozhidar Batsov and Copyright (c) 2017 Test Double, LLC.
See [LICENSE.txt](LICENSE.txt) for further details.
