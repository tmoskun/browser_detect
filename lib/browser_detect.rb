require 'browser_detect/browser_detect_helper'
ActionController::Base.send(:include, BrowserDetect::BrowserDetectHelper)