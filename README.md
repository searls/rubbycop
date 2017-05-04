[![Gem Version](https://badge.fury.io/rb/rubocop.svg)](http://badge.fury.io/rb/rubocop)
[![Dependency Status](https://gemnasium.com/bbatsov/rubocop.svg)](https://gemnasium.com/bbatsov/rubocop)
[![Build Status](https://travis-ci.org/bbatsov/rubocop.svg?branch=master)](https://travis-ci.org/bbatsov/rubocop)
[![Coverage Status](https://img.shields.io/codeclimate/coverage/github/bbatsov/rubocop.svg)](https://codeclimate.com/github/bbatsov/rubocop)
[![Code Climate](https://codeclimate.com/github/bbatsov/rubocop/badges/gpa.svg)](https://codeclimate.com/github/bbatsov/rubocop)
[![Inline docs](http://inch-ci.org/github/bbatsov/rubocop.svg)](http://inch-ci.org/github/bbatsov/rubocop)

[![Gratipay Team](https://img.shields.io/gratipay/team/rubocop.svg?maxAge=2592000)](https://gratipay.com/rubocop/)
[![OpenCollective](https://opencollective.com/rubocop/backers/badge.svg)](#open-collective-backers)
[![OpenCollective](https://opencollective.com/rubocop/sponsors/badge.svg)](#open-collective-sponsors)

<p align="center">
  <img src="https://raw.githubusercontent.com/bbatsov/rubocop/master/logo/rubo-logo-horizontal.png" alt="RubbyCop Logo"/>
</p>

> Role models are important. <br/>
> -- Officer Alex J. Murphy / RoboCop

**RubbyCop** is a Ruby static code analyzer. Out of the box it will
enforce many of the guidelines outlined in the community
[Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).

Most aspects of its behavior can be tweaked via various
[configuration options](https://github.com/bbatsov/rubocop/blob/master/config/default.yml).

Apart from reporting problems in your code, RubbyCop can also
automatically fix some of the problems for you.

## Installation

**RubbyCop**'s installation is pretty standard:

```sh
$ gem install rubbycop
```

If you'd rather install RubbyCop using `bundler`, don't require it in your `Gemfile`:

```rb
gem 'rubocop', require: false
```

RubbyCop's development is moving at a very rapid pace and there are
often backward-incompatible changes between minor releases (since we
haven't reached version 1.0 yet). To prevent an unwanted RubbyCop update you
might want to use a conservative version locking in your `Gemfile`:

```rb
gem 'rubocop', '~> 0.48.1', require: false
```

## Quickstart

Just type `rubocop` in a Ruby project's folder and watch the magic happen.

```
$ cd my/cool/ruby/project
$ rubocop
```

## Official manual

You can read a ton more about RubbyCop in its [official manual](http://rubocop.readthedocs.io).

## Compatibility

RubbyCop supports the following Ruby implementations:

* MRI 2.0
* MRI 2.1
* MRI 2.2
* MRI 2.3
* MRI 2.4
* JRuby 9.0+
* Rubinius 2.0+

## Team

Here's a list of RubbyCop's core developers:

* [Bozhidar Batsov](https://github.com/bbatsov)
* [Jonas Arvidsson](https://github.com/jonas054)
* [Yuji Nakayama](https://github.com/yujinakayama)
* [Evgeni Dzhelyov](https://github.com/edzhelyov)

## Logo

RubbyCop's logo was created by [Dimiter Petrov](https://www.chadomoto.com/). You can find the logo in various
formats [here](https://github.com/bbatsov/rubocop/tree/master/logo).

The logo is licensed under a
[Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/deed.en_GB).

## Contributors

Here's a [list](https://github.com/bbatsov/rubocop/graphs/contributors) of
all the people who have contributed to the development of RubbyCop.

I'm extremely grateful to each and every one of them!

If you'd like to contribute to RubbyCop, please take the time to go
through our short
[contribution guidelines](CONTRIBUTING.md).

Converting more of the Ruby Style Guide into RubbyCop cops is our top
priority right now. Writing a new cop is a great way to dive into RubbyCop!

Of course, bug reports and suggestions for improvements are always
welcome. GitHub pull requests are even better! :-)

## Funding

While RubbyCop is free software and will always be, the project would benefit immensely from some funding.
Raising a monthly budget of a couple of thousand dollars would make it possible to pay people to work on
certain complex features, fund other development related stuff (e.g. hardware, conference trips) and so on.
Raising a monthly budget of over $5000 would open the possibility of someone working full-time on the project
which would speed up the pace of development significantly.

We welcome both individual and corporate sponsors! We also offer a
wide array of funding channels to account for your preferences
(although
currently [Open Collective](https://opencollective.com/rubocop) is our
preferred funding platform).

If you're working in a company that's making significant use of RubbyCop we'd appreciate it if you suggest to your company
to become a RubbyCop sponsor.

You can support the development of RubbyCop via
[Salt](https://salt.bountysource.com/teams/rubocop),
[Gratipay](https://www.gratipay.com/rubocop) and [Open Collective](https://opencollective.com/rubocop).

[![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.1.3/dist/gratipay.png)](https://gratipay.com/rubocop)

### Open Collective Backers

Support us with a monthly donation and help us continue our activities. [[Become a backer](https://opencollective.com/rubocop#backer)]

<a href="https://opencollective.com/rubocop/backer/0/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/0/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/1/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/1/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/2/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/2/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/3/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/3/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/4/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/4/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/5/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/5/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/6/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/6/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/7/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/7/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/8/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/8/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/9/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/9/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/10/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/10/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/11/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/11/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/12/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/12/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/13/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/13/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/14/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/14/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/15/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/15/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/16/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/16/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/17/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/17/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/18/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/18/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/19/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/19/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/20/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/20/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/21/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/21/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/22/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/22/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/23/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/23/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/24/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/24/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/25/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/25/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/26/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/26/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/27/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/27/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/28/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/28/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/backer/29/website" target="_blank"><img src="https://opencollective.com/rubocop/backer/29/avatar.svg"></a>

### Open Collective Sponsors

Become a sponsor and get your logo on our README on GitHub with a link to your site. [[Become a sponsor](https://opencollective.com/rubocop#sponsor)]

<a href="https://opencollective.com/rubocop/sponsor/0/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/1/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/2/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/3/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/4/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/5/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/6/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/7/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/8/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/9/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/9/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/10/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/10/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/11/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/11/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/12/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/12/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/13/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/13/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/14/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/14/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/15/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/15/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/16/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/16/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/17/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/17/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/18/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/18/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/19/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/19/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/20/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/20/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/21/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/21/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/22/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/22/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/23/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/23/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/24/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/24/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/25/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/25/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/26/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/26/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/27/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/27/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/28/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/28/avatar.svg"></a>
<a href="https://opencollective.com/rubocop/sponsor/29/website" target="_blank"><img src="https://opencollective.com/rubocop/sponsor/29/avatar.svg"></a>

## Changelog

RubbyCop's changelog is available [here](CHANGELOG.md).

## Copyright

Copyright (c) 2012-2017 Bozhidar Batsov. See [LICENSE.txt](LICENSE.txt) for
further details.
