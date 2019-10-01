# Searchonastick

`searconastick` searches text files via:

- string match
- regular expression
- through index

and benchmarks the results.

## Installation

### Docker

Sure, this is a ruby gem, but if ruby is not your primary stack and you're not
used to dealing with the arcane minutae that is installing and managing ruby
dependencies, don't worry. We have a docker command for you.

    $ docker build -t searchonastick .

Test your install:

    $ docker run --rm -v "$PWD":/usr/searchonastick -w /usr/searchonastick ruby:2.5 bundle install && rake

You should see output similar to the following:

    Finished in 0.01867 seconds (files took 0.19642 seconds to load)
    26 examples, 0 failures

This runs the `rspec` tests for the codebase.

### Local

Add this line to your application's Gemfile:

```ruby
gem 'searchonastick'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install searchonastick

## Usage

Docker and local usage are slightly different. 

### Docker

To run a `teapot` script:

    $ docker run --rm -v "$PWD":/usr/searchonastick -w /usr/searchonastick ruby:2.5 bundle install && sos

Which will output `I'm a teapot` to the screen.

For help



### Local 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/searchonastick.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
