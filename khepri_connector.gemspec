# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'khepri_connector/version'

Gem::Specification.new do |spec|
  spec.name          = "khepri_connector"
  spec.version       = KhepriConnector::VERSION
  spec.authors       = ["Khepri Dev Team"]
  spec.email         = ["khepri_dev@wister.fr"]

  spec.summary       = %q{connector to use Khepri :: THE ULTIMATE A/B TESTING AND OPTIMIZATION TOOL.}
  spec.homepage      = "http://khepri.tech"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
