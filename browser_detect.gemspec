# -*- encoding: utf-8 -*-
<<<<<<< HEAD
require File.expand_path("../lib/browser_detect/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "browser_detect"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["rlivsey", "faunzy", "tmlee"]
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/browser_detect"
  s.summary     = "Detects the client's browser"
  s.description = "Rlivsey's library to detect the client's browser in a form of a gem!"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "browser_detect"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
=======
files = `git ls-files`.split("\n")
Gem::Specification.new do |s|
  s.name        = "browser_detect"
  s.version     = File.read(File.expand_path(File.dirname(__FILE__)+ "/VERSION")).strip
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["rlivsey", "faunzy", "tmlee", "ggilder"]
  s.email       = []
  s.has_rdoc = 'yard'
  s.homepage    = "http://github.com/traction/browser_detect"
  s.summary     = "A simple rails browser detection plugin"
  s.description = <<-END
	Simple rails browser detection based on original plugin by Richard Livsey"
	END

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "browser_detect"
  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
  
  s.files        = files.reject{|f| f =~ /\.gem$/}
  s.executables  = files.map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
>>>>>>> upstream/master
  s.require_path = 'lib'
end
