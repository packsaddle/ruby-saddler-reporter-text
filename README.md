# Saddler::Reporter::Text

[![Gem Version](http://img.shields.io/gem/v/saddler-reporter-text.svg?style=flat)](http://badge.fury.io/rb/saddler-reporter-text)
[![Build Status](http://img.shields.io/travis/packsaddle/ruby-saddler-reporter-text/master.svg?style=flat)](https://travis-ci.org/packsaddle/ruby-saddler-reporter-text)


## Reporters

Text reporter for [saddler](https://github.com/packsaddle/ruby-saddler).


## Usage

```
$ saddler report \
   --require saddler/reporter/text \
   --reporter Saddler::Reporter::Text
```

like this.


## Example

```xml
$ cat too_long.xml
<?xml version='1.0'?>
<checkstyle>
  <file name='lib/example/travis_ci.rb'>
    <error column='120' line='7' message='Line is too long. [164/120]' severity='info' source='com.puppycrawl.tools.checkstyle.Metrics/LineLength'/>
  </file>
</checkstyle>
```

```bash
$ cat too_long.xml | saddler report --reporter Saddler::Reporter::Text
lib/example/travis_ci.rb:7:120 INFO: Line is too long. [164/120]
(exit status -> 0)
```

```xml
$ cat no_error.xml
<?xml version='1.0' encoding='UTF-8'?>
<checkstyle version='4.3'>
  <file name='/path/to/example/2015-09-16-react-0.14-eslint-1.4-es5.md'/>
</checkstyle>
```

```bash
$ cat no_error.xml | saddler report --reporter Saddler::Reporter::Text
(exit status -> 0)
```

Other [example](./example/example.sh).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'saddler-reporter-text'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install saddler-reporter-text


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

1. Fork it ( https://github.com/packsaddle/ruby-saddler-reporter-text/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
