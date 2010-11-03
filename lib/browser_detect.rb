require 'browser_detect/browser_detect'
ActionController::Base.send(:include, BrowserDetect)
