# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git/flock/version'

Gem::Specification.new do |spec|
  spec.name          = "git-flock"
  spec.version       = Git::Flock::VERSION
  spec.authors       = ["Benjamin Cavileer"]
  spec.email         = ["bcavileer@holmanauto.com"]
  spec.summary       = %q{downloads all git repos from an org}
  spec.description       = %q{downloads all git repos from an org}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
