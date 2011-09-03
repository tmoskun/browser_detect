module OperatingSystems
    
    OS = {
          'Windows 3.11' => 'Win16',
          'Windows 95' => '(Windows 95)|(Win95)|(Windows_95)',
          'Windows 98' => '^(?!(Palm).)*((Windows 98)|(Win98))((?!Palm).)*$',
          'Windows 2000' => '(Windows NT 5.0)|(Windows 2000)',
          'Windows XP' => '(Windows NT 5.1)|(Windows XP)',
          'Windows Server 2003' => '(Windows NT 5.2)',
          'Windows Vista' => '(Windows NT 6.0)',
          'Windows Server 2008 R2' => '(Windows NT 6.1)', 
          'Windows 7' => '(Windows NT 7.0)',
          'Windows NT 4.0' => '(Windows NT 4.0)|(WinNT4.0)|(WinNT)|(Windows NT)',
          'Windows ME' => 'Windows ME',
          'Windows CE' => '^(?!(Palm).)*(Windows CE)((?!Palm).)*$', 
          'Open BSD' => 'OpenBSD',
          'Sun OS' => 'SunOS',
          'Linux' => '^((?!Android).)*((Linux)|(X11))((?!Android).)*$',
          'Mac OS' => '(Mac_PowerPC)|(Macintosh)',
          'iPhone OS' => '(CPU(\siPhone OS (\d_\d)|(\d_\d_\d))? like Mac OS X)|(iPhone)',
          'Android OS' => 'Android',
          'webOS' => 'webOS/', 
          'Palm OS' => '(PalmOS)(Palm750)|(Palm850)|(PalmCentro)|(PalmSource)|(UPG1 UP/4.0)|(Palm\s?500)|(PalmTreo)', 
          'QNX' => 'QNX',
          'BeOS' => 'BeOS',
          'OS/2' => 'OS/2',
          'Search Bot'=>'(nuhk)|(Googlebot)|(Yammybot)|(Openbot)|(Slurp)|(MSNBot)|(Ask Jeeves/Teoma)|(ia_archiver)'
    }
    
end