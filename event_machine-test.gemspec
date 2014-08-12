# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_machine/test/version'

Gem::Specification.new do |spec|
  spec.name          = "event_machine-test"
  spec.version       = '0.0.1'
  spec.authors       = ["Cameron Martin"]
  spec.email         = ["cameronmartin123@gmail.com"]
  spec.summary       = %q{Easily test asynchronous eventmachine code.}
  spec.description   = %q{Easily test asynchronous eventmachine code. Inspired by jasmine.}
  spec.homepage      = "https://github.com/cameron-martin/event_machine-test"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-eventmachine", "~> 0.1"
end
