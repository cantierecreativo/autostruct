# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "autostruct/version"

Gem::Specification.new do |spec|
  spec.name          = "autostruct"
  spec.version       = Autostruct::Version::STRING
  spec.authors       = ["Joe Yates"]
  spec.email         = ["joe.g.yates@gmail.com"]

  spec.summary       = %q{Turn your constructor arguments into attributes}
  spec.description   = %q{
    Classes derived from Autostruct do not need to save the arguments
    to `initialize` as instance variables or set up attribute readers.
  }
  spec.homepage      = "https://github.com/cantierecreativo/autostruct"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
