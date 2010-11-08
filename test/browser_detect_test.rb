require File.expand_path(File.dirname(__FILE__)+'/test_helper')
require '../lib/browser_detect'

class BrowserDetectTest < Test::Unit::TestCase
	fixtures :user_agents
	
	def mock_browser(ua=nil)
		BrowserDetectMock.new(ua)
	end
	
	must "deal with nil user agent gracefully" do
		assert_nothing_raised do
			mock_browser.browser_name
		end
	end
	
	must "correctly mock a user agent string" do
		mock = mock_browser("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)")
		assert_equal("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)", mock.request.env['HTTP_USER_AGENT'])
	end
	
	must "identify googlebot" do
		mock = mock_browser("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)")
		assert_equal('googlebot', mock.browser_name)
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
  include BrowserDetect

	def initialize(user_agent=nil)
		@user_agent = user_agent
	end

	def request
		@req ||= mock_req
	end

	def mock_req
		req = Object.new
		metaclass = class << req; self; end
		user_agent = @user_agent
		metaclass.send :define_method, :env, Proc.new { {'HTTP_USER_AGENT' => user_agent} }
		req
	end  
end
