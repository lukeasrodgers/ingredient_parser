# IngredientParser

[![Build Status](https://github.com/lukeasrodgers/ingredient_parser/actions/workflows/specs.yml/badge.svg)](https://github.com/lukeasrodgers/ingredient_parser/)

Basic recipe ingredient parser using [parslet](https://github.com/kschiess/parslet).

It is not, and will never be, perfect. If it can't separate out a name from an amount, it will fallback to just returning the whole string as the name.

If passed an empty string as input, it will return an empty ingredient object, with `nil` values for `name` and `amount`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ingredient_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ingredient_parser

## Usage

```ruby
2.1.2 :002 > ingr = IngredientParser.parse('10 tablespoons of bananas')
 => #<IngredientParser::Ingredient:0x007f92652c2938 @name="bananas", @amount="10 tablespoons">
2.1.2 :003 > ingr.name
 => "bananas"
2.1.2 :004 > ingr.amount
 => "10 tablespoons"
2.1.2 :005 >
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lukeasrodgers/ingredient_parser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

