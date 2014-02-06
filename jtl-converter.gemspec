# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jtl_converter/version'

Gem::Specification.new do |spec|
  spec.name          = "jtl-converter"
  spec.version       = JtlConverter::VERSION
  spec.authors       = ["itani-hiroki"]
  spec.email         = ["itanihiroki@gmail.com"]
  spec.description   = %q{convert text and image results jmeter}
  spec.summary       = %q{convert text and image results jmeter}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jtl"
  spec.add_dependency "gruff"
  spec.add_dependency "thor"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
