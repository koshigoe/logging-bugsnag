# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logging/plugins/bugsnag'

Gem::Specification.new do |spec|
  spec.name          = "logging-bugsnag"
  spec.version       = Logging::Plugins::Bugsnag::VERSION
  spec.authors       = ["koshigoe"]
  spec.email         = ["koshigoeb@gmail.com"]

  spec.summary       = %q{logging plugin for sending to bugsnag.}
  spec.description   = %q{logging plugin for sending to bugsnag.}
  spec.homepage      = "https://github.com/koshigoe/logging-bugsnag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'

  spec.add_runtime_dependency 'logging'
  spec.add_runtime_dependency 'bugsnag'
end
