# -*- encoding: utf-8 -*-
require File.dirname(__FILE__) + "/lib/grassy/version"
require 'date'

Gem::Specification.new do |s|
  s.name          = 'grassy'
  s.version       = Grassy::VERSION
  s.date          = Date.today.to_s

  s.authors       = ['Shelling Hsu']
  s.email         = ['navyblueshellingford@gmail.com']
  s.homepage      = 'https://github.com/shelling/grassy'
  s.description   = 'Green World ECPay 2.0 Client'
  s.summary       = 'The token-based Ruby client for ECPay'

  s.require_paths = ['lib']
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.license       = 'MIT'

  s.add_runtime_dependency 'aes'
  s.add_runtime_dependency 'json'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
