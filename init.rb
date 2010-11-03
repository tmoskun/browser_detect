require File.expand_path(File.dirname(__FILE__)+'/lib/browser_detect/browser_detect')
ActionView::Base.send(:include, BrowserDetect)