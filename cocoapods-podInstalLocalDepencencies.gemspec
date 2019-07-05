# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-podInstalLocalDepencencies/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-podInstalLocalDepencencies'
  spec.version       = CocoapodsPodinstallocaldepencencies::VERSION
  spec.authors       = ['Leo Valentim']
  spec.email         = ['leo.valent@hotmail.com']
  spec.description   = %q{The Cocoapods-plugin local dependencies manager.}
  spec.summary       = %q{Cocoapods-podInstalLocalDepencencies manages your local dependencies that are referenced in your Podfile with a :path(Local path) defined.}
  spec.homepage      = 'https://github.com/LeoValentim/Pod-Install-Local-Dependencies'
  spec.license       = 'MIT'

  # spec.files = Dir['lib/**/*']
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency "cocoapods", ">= 1.5.0"
  
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
