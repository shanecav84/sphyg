
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sphyg/version"

Gem::Specification.new do |spec|
  spec.name          = "sphyg"
  spec.version       = Sphyg::VERSION
  spec.authors       = ["Shane Cavanaugh"]
  spec.email         = ["shane@shanecav.net"]

  spec.summary       = 'Throbbers for command line programs'
  spec.description   = 'Throbbers for command line programs'
  spec.homepage      = nil
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
