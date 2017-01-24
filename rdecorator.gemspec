# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdecorator/version'

Gem::Specification.new do |spec|
  spec.name          = "rdecorator"
  spec.version       = Rdecorator::VERSION
  spec.authors       = ["Jason Hou"]
  spec.email         = ["hjj1992@gmail.com"]

  spec.summary       = %q{The decorator design pattern for ruby}
  spec.description   = %q{Python like decorator in ruby}
  spec.homepage      = "http://github.com/falm/rdecorator"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.licenses      = ["MIT"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
