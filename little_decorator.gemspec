# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "little_decorator"
  s.version = '0.0.3'
  s.license = "MIT"
  s.authors = ["Vic Ramon"]
  s.email = ["vic@vicramon.com.com"]
  s.description = "Ultra lightweight decorator for Rails models."
  s.require_paths = ["lib"]
  s.summary = "Ultra lightweight decorator for Rails models."
  s.required_ruby_version = '>= 1.9.3'
  s.files = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = 'lib'

  s.add_runtime_dependency 'rails'
end
