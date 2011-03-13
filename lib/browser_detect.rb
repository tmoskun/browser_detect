module BrowserDetect
	def browser_is? name
		name = name.to_s.strip
		browser_agent_query(name)
	end
	
	def browser_agent_query query
		# define browser groupings here (mobile, robots, etc.)
		# also complex queries like IE where we weed out fake IE user agents
		# the default case just checks if user agent contains the query string
		result = case query
		when /ie(\d)/
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
		when 'robots'
			ua.match(/googlebot|msnbot/) || browser_agent_query('yahoobot')
		when 'mobile'
			browser_agent_query('ios') || ua.match(/android|webos|mobile/)
		else
			ua.index(query)
		end
		not result.nil?
	end
	
	# Determine the version of webkit.
	# Useful for determing rendering capabilities
	# For instance, Webkit versions lower than 532 don't handle webfonts very well (intermittent crashing when using multiple faces/weights)
	def browser_webkit_version
		if browser_is? 'webkit'
			match = ua.match(%r{\bapplewebkit/([\d\.]+)\b})
			if (match)
				match[1].to_f
			else
				0
			end
		else
			0
		end
	end
	
	def browser_is_mobile?
		browser_is?('mobile')
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