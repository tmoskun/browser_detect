require File.expand_path(File.dirname(__FILE__)+'/test_helper')
require 'browser_detect_helper'

class BrowserDetectHelperTest < Test::Unit::TestCase
	fixtures :user_agents
	
	def mock_browser(ua=nil)
		BrowserDetectMock.new(ua)
	end
	
	must "deal with nil user agent gracefully" do
		assert_nothing_raised do
			mock_browser.browser_name
		end
	end
	
	must "correctly identify known user agents" do
		user_agents(:browsers).each do |browser|
			mock = mock_browser(browser['ua'])
			browser['name'].each do |name|
				assert(mock.browser_is?(name), "Browser '#{browser['nickname']}' did not match name '#{name}'!")
			end
		end
	end
end

class BrowserDetectMock
	include BrowserDetectHelper

	def initialize(user_agent=nil)
		@user_agent = user_agent
	end

	def request
		@req ||= mock_req
	end

	def mock_req
		req = Object.new
		metaclass = class << req; self; end
		metaclass.send(:define_method, :env) do
			{'HTTP_USER_AGENT' => @user_agent}
		end
		req
	end
end
