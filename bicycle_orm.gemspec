# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bicycle_orm/version'

Gem::Specification.new do |spec|
  spec.name          = 'bicycle_orm'
  spec.version       = BicycleOrm::VERSION
  spec.authors       = ['Emil Shakirov']
  spec.email         = ['5o.smoker@gmail.com']

  spec.summary       = 'Tiny gem that demonstrating simple ORM realizaition.'
  spec.description   = 'Tiny gem that demonstrating simple ORM realizaition.'
  spec.homepage      = 'https://github.com/vaihtovirta/bicycle_orm'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport-inflector'
  spec.add_runtime_dependency 'i18n'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'sqlite3'
end
