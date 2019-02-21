Pod::Spec.new do |s|
  s.name             = 'RFNavigationController'
  s.version          = '0.1.0'
  s.summary          = 'NSNavigationController for macOS.'

  s.homepage         = 'https://github.com/RFUI/RFNavigationController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BB9z' => 'bb9z@me.com' }
  s.source           = { :git => 'https://github.com/RFUI/RFNavigationController.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.osx.deployment_target = '10.10'

  s.source_files = ['Implementation/*.{h,m}']
  s.public_header_files = ['Implementation/*.h']

  s.pod_target_xcconfig = {
  }
end
