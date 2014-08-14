Pod::Spec.new do |s|
  s.name     = 'CHStringAdditions'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Convenience methods on NSString'
  s.homepage = 'http://gitlab.chaione.com/chaikit/chstringadditions'
  s.authors   = { 'Terry Lewis' => 'terry@ploverproductions.com' }

  s.source   = { :git => 'http://gitlab.chaione.com/chaikit/chstringadditions.git', :tag => 'v1.0.0' }
  s.description = 'A number of functions that make working with NSString\'s easier, such as isValidEmail and asWords.'

  s.platform = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'CHStringAdditions/Source/*.{h,m}'

end
