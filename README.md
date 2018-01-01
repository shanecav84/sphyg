# Sphyg

'Sphygmos' is the Greek word for 'pulse'. Sphyg provides an interface for
creating [throbbers](https://en.wikipedia.org/wiki/Throbber) to indicate that
your long-running command line program still has a pulse.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sphyg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sphyg

## Usage

Pass the _message_ you want to display while your command is running
and a _block_ containing your long-running command to `Sphyg.pulse`.

```ruby
> ::Sphyg.pulse('Please wait') { sleep }
Please wait ⡀ ⠄ ⠂ ⠁ ⠂ ⠄ # animated 
```

### Options

You can also pass an _options_ hash to `::Sphyg.pulse` to customize the displayed
throbber. A throbber consists of an array of _frames_, an _enumerator_, and a
_rate_. The following are built-in throbbers. You may use the `:kind` key to 
choose a built-in throbber, or utilize `::Sphyg::THROBBERS` to configure them.

#### `:kind`

Configure which kind of throbber you would like to use. Available kinds and their associated frames:

| Kind | Frames |
| ---- | ------ |
| `:ascii` | \| / - \ |
| `:elipsis` | . .. ... .. |
| `:heart` | ❤ 🧡 💛 💚 💙 💜 |
| `:heroku` | ⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷ |
| `:moon` | 🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘 |
| `:time` | 🕛 🕐 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 |
| `:wave` | ⡀ ⠄ ⠂ ⠁ ⠂ ⠄ |

#### `:frames`

An array of strings from which to choose to display.

#### `:enumerator`

The string name of an object that is used to generate successive frames
to display. Must receive an array of strings, which will be set to an instance
variable, `@frames`. Must respond to `#next`. For example:

```ruby
Randomizer = Struct.new(:frames) { def next; @frames.sample; end }
options = {
  frames: %w[a b c],
  enumerator: 'Randomizer',
  rate: 0.1
}
> Sphyg.pulse('Please wait', options) { sleep }
Please wait a # Will display a random value from `frames` every 0.1 seconds alongside the message

```

See [`Sphyg::Enumerators`](lib/sphyg/enumerators) for more examples.

#### `:rate`

An `Integer` or `Float` representing the 'frame' rate of the throbber in 
seconds. Sphyg will cycle through the enumerator at this value.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Run `bundle exec rake` to lint and run tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shanecav84/sphyg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sphyg project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/shanecav84/sphyg/blob/master/CODE_OF_CONDUCT.md).
