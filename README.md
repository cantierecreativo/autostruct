# Autostruct

The aim is reduce the work of defining classes.

A common repetetive task is receiving parameters, assigning them
to instance variables and defining attribute accessors, like this:

```ruby
class Foo
  attr_reader :bar

  def initialize(bar:)
    @bar = bar
  end
end

foo = Foo.new(bar: "Hello")
puts foo.bar # => Hello
```

With `Autostruct` you do this:

```ruby
require "autostruct/wrap"

class Foo
  def initialize(bar:)
  end

  include Autostruct::Wrap
end

foo = Foo.new(bar: "Hello")
puts foo.bar # => Hello
```

# Limitations

* it only works with obbligatory parameters

# Why not Struct?

* It doesn't handle required parameters

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'autostruct'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autostruct

# Usage

There are 3 ways of using Autostruct.

## Autostruct::Wrapper

```ruby
require "autostruct/wrap"

class Foo
  def initialize(bar:, baz:)
  end

  include Autostruct::Wrap
end
```

Just do the `include` *after* defining `initialize`.

## Autostruct::Mixin

```ruby
require "autostruct/mixin"

class Foo
  include Autostruct::Mixin

  def initialize(bar:, baz:)
    autostruct! binding
  end
end
```

## Autostruct::Class

```ruby
require "autostruct/class"

class Foo < Autostruct::Class
  def initialize(bar:, baz:)
    super
  end
end
```

# Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

# Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/joeyates/autostruct. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

# License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
