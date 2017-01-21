# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ingredient_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "ingredient_parser"
  spec.version       = IngredientParser::VERSION
  spec.authors       = ["Luke Rodgers"]
  spec.email         = ["lukeasrodgers@gmail.com"]

  spec.summary       = %q{Basic recipe ingredient parser.}
  spec.homepage      = "https://github.com/lukeasrodgers/ingredient_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'parslet', '~> 1.6' 

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
