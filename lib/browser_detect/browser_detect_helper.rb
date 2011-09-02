module BrowserDetectHelper
   
  # Check for Mobility
  def browser_is_mobile?
    mobile_browsers = ["android", "ipod", "iphone", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "pda","psp","treo"]
    agent = request.headers["HTTP_USER_AGENT"].downcase
    mobile_browsers.each do |m|
      return true if agent.match(m)
    end
    return false
  end
  
  #Browser groupings
	def browser_is? name
		name = name.to_s.strip
		return true if browser_name == name
		return true if name == 'mozilla' && browser_name == 'gecko'
		return true if name == 'ie' && browser_name.index('ie')
		return true if name == 'webkit' && %w{safari chrome iphone ipad ipod}.include?(browser_name)
		return true if name == 'ios' && %w{iphone ipad ipod}.include?(browser_name)
		return true if name == 'robots' && %w{googlebot msnbot yahoobot}.include?(browser_name)
	end

  # Returns the user agent string as determined by the plugin
	def browser_name
		@browser_name ||= begin
			if ua.index('msie') && !ua.index('opera') && !ua.index('webtv')
				'ie'+ua[ua.index('msie')+5].chr
			elsif ua.index('webtv')
        'webtv'
      elsif ua.index(/(Mobile\/.+Safari)/)
        'mobile safari'	
			elsif ua.index('firefox/')
			  'firefox'
			elsif ua.index('gecko/')
				'gecko'
			elsif ua.index('opera')
				'opera'
			elsif ua.index('konqueror')
				'konqueror'
			elsif ua.index('ipod')
				'ipod'
			elsif ua.index('iphone')
				'iphone'
			elsif ua.index('ipad')
				'ipad'
			elsif ua.index('chrome/')
				'chrome'
			elsif ua.index('applewebkit/')
				'safari'
			elsif ua.index('googlebot/')
				'googlebot'
			elsif ua.index('msnbot')
				'msnbot'
			elsif ua.index('yahoo! slurp')
				'yahoobot'
			#Everything thinks it's mozilla, so this goes last
			elsif ua.index('mozilla/')
				'gecko'
			else
				'unknown'
			end

		end
	end
	
	# Determine the version of webkit.
	# Useful for determing rendering capabilties

	def browser_webkit_version
		if browser_is? 'webkit'
			match = ua.match(%r{\bapplewebkit/([\d\.]+)\b})
			if (match)
				match[1].to_f
			else
				nil
			end
		else
			nil
		end
	end
	

  #Gather the user agent and store it for use.
	def ua
		@ua ||= begin
			request.env['HTTP_USER_AGENT'].downcase
		rescue
			''
		end
	end
end
