require File.expand_path(File.dirname(__FILE__)+'/spec_helper')
require File.expand_path(File.dirname(__FILE__)+'/../lib/browser_detect_helper')

describe BrowserDetectHelper do
	
	
	before(:each) do
		@mock = BrowserDetectMock.new
	end
	
	it "should deal with nil user agent gracefully" do
		lambda{@mock.browser_name}.should_not raise_error
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

