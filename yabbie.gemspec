# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yabbie/version'

Gem::Specification.new do |spec|
  spec.name          = "yabbie"
  spec.version       = Yabbie::VERSION
  spec.authors       = ["Ricardo Bernardeli"]
  spec.email         = ["ricardobcs@gmail.com"]
  spec.summary       = %q{Yabbie. Like shrimp for PhantomJS, but for SlimerJS.}
  spec.description   = %q{Delicious}
  spec.homepage      = "https://github.com/net-engine/yabbie"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.requirements  << 'slimerjs, v0.9.4 or greater'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "pry-meta", "~> 0.0"
end
