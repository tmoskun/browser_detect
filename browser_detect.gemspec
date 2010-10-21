# -*- encoding: utf-8 -*-
require File.expand_path("../lib/browser_detect/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "browser_detect"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["faunzy"]
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/browser_detect"
  s.summary     = "Detects the client's browser"
  s.description = "Client browser detector"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "browser_detect"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
