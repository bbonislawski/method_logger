# MethodLogger

Ultra simple gem that contains module that you can include to any class to log all method calls to standard output or/and
file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'method_logger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install method_logger

## Usage

Include mixin in your class like this:
```ruby
include MethodLogger::mixin({})
```

You can customize it by passing options to mixin in hash:
```
{
  ignored_methods: [], # [Array of symbols] used to ignore methods that we don't need to see
  logger: Logger.new(File.open(options[:filename], 'a+')), # if you don't like basic ruby logger, you can pass your own. It
  must respond to #info
  formatter: DefaultFormatter.new, # this is used for formatting. You can pass any object that responds to #call method
  filename: 'method_logger_log.txt', # filename to put logs in default logger
  log_to_file: false ,# determines if it should log to file
  log_to_stdout: true # determines if it should log to standard output
}
```




## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/method_logger.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
