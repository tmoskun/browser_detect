Browser Detect
==============
_It's like a crystal ball for user agents._

Detect it.
----------

Detects the client browser using the user agent string that was used to make the page request. 

Browser Detect currently supports the following browsers and platforms:

Browsers:

  * ie
  * gecko
  * konqueror
  * opera
  * ipad
  * ipod
  * iphone
  * chrome
  * safari

Robots:

  * googlebot
  * msnbot
  * yahoo!

Operating Systems:

  * TODO

Use it.
-------

Using Bundler, all you need to do is add the source to your Gemfile:

	gem "browser_detect", :git => "git://github.com/traction/browser_detect.git"

Install it:
-----------

Then run:

	bundle install
	
or, install it as a plugin:

	script/plugin install git://github.com/traction/browser_detect.git
	
Wield it.
---------

To check the type of browser, use browser_name
@browser_name will return either 'ie', 'gecko', 'opera', 'konqueror', 'ipod', 'ipad', 'iphone', 'chrome', 'safari', 'googlebot', 'msnbot', 'yahoobot'

	def index
		@browser_name = browser_name
	end

To check if a particular browser made the request, use browser_name?(name)
If the browser used is chrome, it will return True

	def index
		@browser_type = browser_is?("chrome")
	end
	
or in a view using ERB:
	
	<%= browser_is?(:chrome) ? "secrets" : "buzz off" %>
	
Or choose from the following groupings:

 * mozilla
 * ie
 * webkit 
 * robots
	

