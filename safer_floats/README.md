Safer Floats
============

This gem will raise an exception when trying to test floating point numbers for equality.
In my opinion, it's much preferable to get an error than to get the wrong answer.

This will prevent this from happening:

~~~ ruby
x = 0.1 + 0.2
puts "This prints, but it should not!" if x != 0.3
~~~

This happens because the decimal (base 10) numbers we use cannot be converted into exact base 2 floats.
So the internal representations of `0.1` and `0.2` are not exact, nor is the sum of those 2 numbers.
And the sum of those 2 numbers will not be exactly `0.3`, and in fact has a slightly different value
than the directly-entered `0.3`.

To compare floats, use an "epsilon" value, to see if the 2 values being compared are "close enough":

~~~ ruby
EPSILON = 0.0001
x = 0.1 + 0.2
puts "This should not print." if (0.3 - x).abs > EPSILON
~~~

RSpec has a nice alternative:

~~~ ruby
EPSILON = 0.0001
expect(0.1 + 0.2).to be_within(EPSILON).of(0.3)
~~~


## Installation

Add this line to your application's Gemfile:

~~~ ruby
gem 'safer_floats'
~~~

And then execute:

~~~ shell
bundle
~~~

Or install it yourself:

~~~ shell
gem install safer_floats
~~~


## Usage

~~~ ruby
require 'safer_floats'
0.1 + 0.2 == 0.3  # Will raise a SaferFloats::Error exception.
0.2 + 0.2 != 0.3  # Will raise a SaferFloats::Error exception.
~~~


## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, then run `bundle exec rake release`.
This will create a git tag for the version, then push git commits and tags.
It will also push the gem to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/boochtek/ruby_experiments.
