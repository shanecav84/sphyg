
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sphyg/version'

Gem::Specification.new do |spec|
  spec.name          = 'sphyg'
  spec.version       = Sphyg::VERSION
  spec.authors       = ['Shane Cavanaugh']
  spec.email         = ['shane@shanecav.net']

  spec.summary       = 'Configure custom throbbers for command line programs'
  spec.description   = "'Sphygmos' is the Greek word for 'pulse'. Sphyg " \
    'provides an interface for creating throbbers to indicate that your ' \
    'long-running command line program still has a pulse.'
  spec.homepage      = nil
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2.9'

  spec.add_development_dependency 'bundler', '~> 2.2.33'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.0'
end
