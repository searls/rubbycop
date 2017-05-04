[![Gem Version](https://badge.fury.io/rb/rubbycop.svg)](http://badge.fury.io/rb/rubbycop)
[![Dependency Status](https://gemnasium.com/searls/rubbycop.svg)](https://gemnasium.com/searls/rubbycop)
[![Build Status](https://travis-ci.org/searls/rubbycop.svg?branch=master)](https://travis-ci.org/searls/rubbycop)
[![Coverage Status](https://img.shields.io/codeclimate/coverage/github/searls/rubbycop.svg)](https://codeclimate.com/github/searls/rubbycop)
[![Code Climate](https://codeclimate.com/github/searls/rubbycop/badges/gpa.svg)](https://codeclimate.com/github/searls/rubbycop)
[![Inline docs](http://inch-ci.org/github/searls/rubbycop.svg)](http://inch-ci.org/github/searls/rubbycop)

[![Gratipay Team](https://img.shields.io/gratipay/team/rubbycop.svg?maxAge=2592000)](https://gratipay.com/rubbycop/)
[![OpenCollective](https://opencollective.com/rubbycop/backers/badge.svg)](#open-collective-backers)
[![OpenCollective](https://opencollective.com/rubbycop/sponsors/badge.svg)](#open-collective-sponsors)

<p align="center">
  <img src="https://raw.githubusercontent.com/searls/rubbycop/master/logo/rubo-logo-horizontal.png" alt="RubbyCop Logo"/>
</p>

> Role models are important. <br/>
> -- Officer Alex J. Murphy / RoboCop

**RubbyCop** is a Ruby static code analyzer. Out of the box it will
enforce many of the guidelines outlined in the community
[Ruby Style Guide](https://github.com/searls/ruby-style-guide).

Most aspects of its behavior can be tweaked via various
[configuration options](https://github.com/searls/rubbycop/blob/master/config/default.yml).

Apart from reporting problems in your code, RubbyCop can also
automatically fix some of the problems for you.

## Installation

**RubbyCop**'s installation is pretty standard:

```sh
$ gem install rubbycop
```

If you'd rather install RubbyCop using `bundler`, don't require it in your `Gemfile`:

```rb
gem 'rubbycop', require: false
```

RubbyCop's development is moving at a very rapid pace and there are
often backward-incompatible changes between minor releases (since we
haven't reached version 1.0 yet). To prevent an unwanted RubbyCop update you
might want to use a conservative version locking in your `Gemfile`:

```rb
gem 'rubbycop', '~> 0.49.0', require: false
```

## Quickstart

Just type `rubbycop` in a Ruby project's folder and watch the magic happen.

```
$ cd my/cool/ruby/project
$ rubbycop
```

## Official manual

You can read a ton more about RubbyCop in its [official manual](http://rubbycop.readthedocs.io).

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

* [Bozhidar Batsov](https://github.com/searls)
* [Jonas Arvidsson](https://github.com/jonas054)
* [Yuji Nakayama](https://github.com/yujinakayama)
* [Evgeni Dzhelyov](https://github.com/edzhelyov)

## Logo

RubbyCop's logo was created by [Dimiter Petrov](https://www.chadomoto.com/). You can find the logo in various
formats [here](https://github.com/searls/rubbycop/tree/master/logo).

The logo is licensed under a
[Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/deed.en_GB).

## Contributors

Here's a [list](https://github.com/searls/rubbycop/graphs/contributors) of
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
currently [Open Collective](https://opencollective.com/rubbycop) is our
preferred funding platform).

If you're working in a company that's making significant use of RubbyCop we'd appreciate it if you suggest to your company
to become a RubbyCop sponsor.

You can support the development of RubbyCop via
[Salt](https://salt.bountysource.com/teams/rubbycop),
[Gratipay](https://www.gratipay.com/rubbycop) and [Open Collective](https://opencollective.com/rubbycop).

[![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.1.3/dist/gratipay.png)](https://gratipay.com/rubbycop)

### Open Collective Backers

Support us with a monthly donation and help us continue our activities. [[Become a backer](https://opencollective.com/rubbycop#backer)]

<a href="https://opencollective.com/rubbycop/backer/0/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/0/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/1/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/1/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/2/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/2/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/3/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/3/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/4/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/4/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/5/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/5/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/6/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/6/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/7/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/7/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/8/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/8/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/9/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/9/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/10/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/10/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/11/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/11/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/12/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/12/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/13/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/13/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/14/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/14/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/15/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/15/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/16/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/16/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/17/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/17/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/18/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/18/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/19/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/19/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/20/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/20/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/21/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/21/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/22/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/22/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/23/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/23/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/24/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/24/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/25/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/25/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/26/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/26/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/27/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/27/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/28/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/28/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/backer/29/website" target="_blank"><img src="https://opencollective.com/rubbycop/backer/29/avatar.svg"></a>

### Open Collective Sponsors

Become a sponsor and get your logo on our README on GitHub with a link to your site. [[Become a sponsor](https://opencollective.com/rubbycop#sponsor)]

<a href="https://opencollective.com/rubbycop/sponsor/0/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/1/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/2/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/3/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/4/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/5/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/6/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/7/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/8/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/9/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/9/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/10/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/10/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/11/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/11/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/12/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/12/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/13/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/13/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/14/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/14/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/15/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/15/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/16/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/16/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/17/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/17/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/18/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/18/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/19/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/19/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/20/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/20/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/21/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/21/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/22/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/22/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/23/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/23/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/24/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/24/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/25/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/25/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/26/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/26/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/27/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/27/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/28/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/28/avatar.svg"></a>
<a href="https://opencollective.com/rubbycop/sponsor/29/website" target="_blank"><img src="https://opencollective.com/rubbycop/sponsor/29/avatar.svg"></a>

## Changelog

RubbyCop's changelog is available [here](CHANGELOG.md).

## Copyright

Copyright (c) 2012-2017 Bozhidar Batsov. See [LICENSE.txt](LICENSE.txt) for
further details.
