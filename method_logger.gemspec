# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "method_logger/version"

Gem::Specification.new do |spec|
  spec.name          = "method_logger"
  spec.version       = MethodLogger::VERSION
  spec.authors       = ["Bartosz Bonisławski"]
  spec.email         = ["b.bonislawski@hotmail.com"]

  spec.summary       = %q{Gem that logs all method calls in your class}
  spec.homepage      = "https://github.com/bbonislawski/method_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
