# PDF Links Checker

[![Build Status](https://travis-ci.org/AndyWendt/pdf_links_checker.svg?branch=master)](https://travis-ci.org/AndyWendt/pdf_links_checker)

A utility to ensure that links in PDFs are reachable

## Installation

    $ gem install pdf_links_checker

## Usage

    $ pdf_links_checker path/to/file.pdf`
    Working links: 1 of 2
    https://not-a-chance-that-this-is-a-working-link.com/


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andywendt/pdf_links_checker.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
