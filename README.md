# Sphyg

'Sphygmos' is the Greek word for 'pulse'. Sphyg provides [throbbers](https://en.wikipedia.org/wiki/Throbber)
for command line programs. 

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

Pass the _message_ you want to display while your command is running, an _options_ hash, 
and a _block_ containing your long-running command to `Sphyg.pulse`.

```ruby
> message = 'Please wait'
> options = { kind: :wave }
> ::Sphyg.pulse(message, options) { while true; sleep 1; end }
Please wait ⡀ ⠄ ⠂ ⠁ ⠂ ⠄ # animated 
```

### Options

#### Kind

See [`Sphyg::FRAMES`](lib/sphyg/frames.rb) for throbber kinds and their associated animation frames.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shanecav84/sphyg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sphyg project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/shanecav84/sphyg/blob/master/CODE_OF_CONDUCT.md).
