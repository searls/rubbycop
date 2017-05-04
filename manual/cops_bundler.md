# Bundler

## Bundler/DuplicatedGem

Enabled by default | Supports autocorrection
--- | ---
Enabled | No

A Gem's requirements should be listed only once in a Gemfile.

### Example

```ruby
# bad
gem 'rubbycop'
gem 'rubbycop'

# bad
group :development do
  gem 'rubbycop'
end

group :test do
  gem 'rubbycop'
end

# good
group :development, :test do
  gem 'rubbycop'
end

# good
gem 'rubbycop', groups: [:development, :test]
```

### Important attributes

Attribute | Value
--- | ---
Include | \*\*/Gemfile, \*\*/gems.rb

## Bundler/OrderedGems

Enabled by default | Supports autocorrection
--- | ---
Enabled | Yes

Gems should be alphabetically sorted within groups.

### Example

```ruby
# bad
gem 'rubbycop'
gem 'rspec'

# good
gem 'rspec'
gem 'rubbycop'

# good
gem 'rubbycop'

gem 'rspec'

# good only if TreatCommentsAsGroupSeparators is true
# For code quality
gem 'rubbycop'
# For tests
gem 'rspec'
```

### Important attributes

Attribute | Value
--- | ---
Include | \*\*/Gemfile, \*\*/gems.rb
TreatCommentsAsGroupSeparators | true
