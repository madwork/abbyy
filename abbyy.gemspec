# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'abbyy/version'

Gem::Specification.new do |spec|
  spec.name          = "abbyy"
  spec.version       = Abbyy::VERSION
  spec.authors       = ["Vincent Durand"]
  spec.email         = ["vincent.durand@madwork.org"]
  spec.summary       = %q{A Ruby wrapper for the Abbyy Cloud OCR SDK API.}
  spec.homepage      = "https://github.com/madwork/abbyy"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.0"
  spec.add_development_dependency "pry", "~> 0"
  spec.add_development_dependency "pry-doc", "~> 0"

  spec.add_dependency "rest-client", ">= 1.8.0"
end
