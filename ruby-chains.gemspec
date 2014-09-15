# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chains/version'

Gem::Specification.new do |gem|
  gem.name          = 'ruby-chains'
  gem.version       = Chains::VERSION
  gem.authors       = ['James Osler']
  gem.email         = ['j.osler@gmail.com']
  gem.description   = %q{Chaining and With}
  gem.summary       = gem.description
  gem.homepage      = ''
  gem.add_development_dependency "minitest"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
