# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blazing-foreman/version"

Gem::Specification.new do |s|
  s.name        = "blazing-foreman"
  s.version     = Blazing::Foreman::VERSION
  s.authors     = ["Daniel Farrell"]
  s.email       = ["danielfarrell76@gmail.com"]
  s.homepage    = "https://github.com/danielfarrell/blazing-foreman"
  s.summary     = %q{blazing recipes for deploying processes with foreman}
  s.description = %q{blazing recipes for deploying processes with foreman}

  s.rubyforge_project = "blazing-foreman"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "blazing", '>= 0.2.9'
  s.add_dependency "foreman"
end
