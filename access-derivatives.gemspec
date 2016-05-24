# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'access/derivatives/version'

Gem::Specification.new do |spec|
  spec.name          = "access-derivatives"
  spec.version       = Access::Derivatives::VERSION
  spec.authors       = ["Jason Ronallo"]
  spec.email         = ["jronallo@gmail.com"]
  spec.summary       = %q{Create access derivative files.}
  spec.description   = %q{Create access derivative files including JP2s and videos.}
  spec.homepage      = "https://github.com/jronallo/access-derivatives"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mail", '~> 2.6'
  spec.add_dependency "iiif_url", '~> 0.0.2'
  spec.add_dependency "httpclient", '~> 2.7'
  spec.add_dependency "oily_png", '~> 1.2'
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", '~> 0'
end
