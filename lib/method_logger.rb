require 'logger'
require "method_logger/version"

module MethodLogger
  class Mixin < Module
    def initialize(options = {})
      @_options = default_options.merge(options)
      @_methods = options[:methods]
    end

    def included(base_class)
      options = @_options
      methods = @_methods || base_class.instance_methods(options[:include_inherited])
      methods -= Object.methods if options[:include_inherited]
      methods += base_class.private_instance_methods(false)
      methods -= options[:ignored_methods]
      formatter = options.delete(:formatter) || default_formatter
      logger = options[:logger] || default_logger(options)

      base_class.class_eval do
        methods.each do |method_name|
          method = instance_method(method_name)

          define_method(method_name) do |*args, &block|
            return_value = method.bind(self).call(*args, &block)
            text = formatter.call(base_class, method_name, args.inspect, return_value.inspect)
            puts(text) if options[:log_to_stdout]
            logger.info(text) if options[:log_to_file]
            return_value
          end
        end
      end
    end

    private

    def default_options
      {
        include_inherited: true,
        ignored_methods: [],
        logger: nil,
        formatter: DefaultFormatter.new,
        filename: 'method_logger_log.txt',
        log_to_file: false,
        log_to_stdout: true
      }
    end

    def default_logger(options)
      Logger.new(File.open(options[:filename], 'a+'))
    end

    def default_formatter
      DefaultFormatter.new
    end
  end

  def self.mixin(options = {})
    Mixin.new(options)
  end

  class DefaultFormatter
    def call(base_class, method_name, args, return_value)
      "#{base_class}##{method_name}(#{args}) was called and returned #{return_value}"
    end
  end
end
