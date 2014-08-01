# Yabbie

Yabbie is a gem to wrap SlimerJS.

## Installation

Add this line to your application's Gemfile:

    gem 'yabbie', github: 'net-engine/yabbie'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yabbie

## Dependency

It relies on [SlimerJS](http://slimerjs.org), and a script that contains what you want to achieve.
For the script, you can check our [default.js](https://github.com/net-engine/yabbie/blob/master/lib/yabbie/default.js). It does nothing but takes a png snapshot. It is just so that Yabbie does not fail if you don't provide one. Please don't rely on it.

## Usage

    Yabbie::Slimer.new(html_file, options).to_file(file)

For more usage, please investigate in the code while we don't build a nice README

## Roadmap

1. Add tests, sorry for that. :)

## And the oscar goes to...

This gem is inspired on [Shrimp](https://github.com/adjust/shrimp) gem.

A huge thanks to all Shrimp contributors.

## Contributing

1. Fork it (https://github.com/net-engine/yabbie/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT

