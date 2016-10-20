# TopBeers

TopBeers CLI App, the place to go for information on the best beers in the world! This app scrapes from Beer Advocate's Top 250 beer list and provides detailed information that can be interacted with using the command line. 

## Installation

Install with:

    $ gem install top-beers-cli-app

## Usage

After installation, type the command 'top-beers' in the command line. You will be presented with a numbered list of the 25 best beers. From this menu, you can:

Type a number to access detailed information about the accompanying beer
Type 'more' to see 25 more beers, up to 250
Type 'all' to see all 250 beers at once

There are two other menus accessible in the TopBeers app:
'breweries' accesses all of the breweries with beers in the top 250 list
'styles' accesses all of the styles represented in the top 250 list

Selecting a single beer/brewery/style is always done by typing the accompanying number. 

Type 'help' from any menu to see the the complete list of commands

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BeejLuig/top-beers-cli-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
