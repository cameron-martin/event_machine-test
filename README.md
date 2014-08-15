[![Build Status](https://travis-ci.org/cameron-martin/event_machine-test.svg?branch=master)](https://travis-ci.org/cameron-martin/event_machine-test)

# EventMachine::Test

Small library for testing asynchronous eventmachine code. It is [inspired by jasmine][1].

Each example spins up it's own reactor, you make your expectations/assertions, and you call a done callback when you've finished.
If your example takes too long, it throws an error.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'event_machine-test'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install event_machine-test

## Usage

```ruby

describe YourLib do

  include EventMachine::Test.new(5) # Pass timeout in seconds

  it 'does something' do
    em_test do |done|

      # Do some actual useful asynchronous stuff, then call done when you've finished
      EventMachine.add_timer(1) do
        expect(true).to eq(true)
        done.call
      end

    end
  end

end
```

## How it works

1. Spins up eventmachine inside a block
2. Sets a timer to throw a `TimeoutError`
3. Runs the block passed to `em_test`, passing a done callback which throws a symbol when called.
4. Symbol is caught outside eventmachine reactor, and the block terminates (with no error).

## TODO

* Write better tests. I tried using rspec-eventmachine for controlling the clock, but it just froze
* Write integration for rspec (in a separate gem), to avoid having an extra level of indentation for each code block.


## Contributing

1. Fork it ( https://github.com/cameron-martin/event_machine-test/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[1]: http://jasmine.github.io/2.0/introduction.html#section-Asynchronous_Support
