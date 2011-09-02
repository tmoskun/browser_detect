require "../lib/browser_detect/operating_systems"
module BrowserDetect
  
  include OperatingSystems
  
	# Define browser groupings (mobile, robots, etc.)
	# Also define complex queries like IE where we weed out user agents that pose as IE
	# The default case just checks if the user agent contains the query string
	def browser_is? query
		query = query.to_s.strip.downcase
		result = case query
		when /^ie(\d+)$/
			ua.index("msie #{$1}") && !ua.index('opera') && !ua.index('webtv')
		when 'ie'
			ua.match(/msie \d/) && !ua.index('opera') && !ua.index('webtv')
		when 'yahoobot'
			ua.index('yahoo! slurp')
		when 'mozilla'
			ua.index('gecko') || ua.index('mozilla')
		when 'webkit'
			ua.match(/webkit|safari|chrome|iphone|ipad|ipod/)
		when 'ios'
			ua.match(/iphone|ipad|ipod/)
		when /^robot(s?)$/
			ua.match(/googlebot|msnbot/) || browser_is?('yahoobot')
		when 'mobile'
			browser_is?('ios') || ua.match(/android|webos|mobile/)
		else
			ua.index(query)
		end
		not result.nil?
	end
	
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
	# Useful for determing rendering capabilities
	# For instance, Mobile Webkit versions lower than 532 don't handle webfonts very well (intermittent crashing when using multiple faces/weights)
	def browser_webkit_version
		if browser_is? 'webkit'
			match = ua.match(%r{\bapplewebkit/([\d\.]+)\b})
			match[1].to_f if (match)
		end or 0
	end
	
	def browser_is_mobile?
		browser_is? 'mobile'
	end
	
	def os_name
     #ua = ''
     #ua = request.env['HTTP_USER_AGENT'].downcase if request.env['HTTP_USER_AGENT']
     OS.each do |os, str|
       return os if ua =~ Regexp.new(str, true)
     end
     return "unknown"
  end

	# Gather the user agent and store it for use.
	def ua
		@ua ||= begin
			request.env['HTTP_USER_AGENT'].downcase
		rescue
			''
		end
	end
end
