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
