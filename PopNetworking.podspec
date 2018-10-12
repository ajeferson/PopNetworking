Pod::Spec.new do |s|
  s.name             = 'PopNetworking'
  s.version          = '0.1.0'
  s.summary          = 'A short description of PopNetworking.'
  s.description      = 'A networking for working with Ruby on Rails'
  s.homepage         = 'https://github.com/ajeferson/PopNetworking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ajeferson' => 'alan.jeferson11@gmail.com' }
  s.source           = { :git => 'https://github.com/ajeferson/PopNetworking.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'

  s.source_files = 'PopNetworking/Classes/**/*'
  
  # Dependencies
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'Alamofire', '~> 4.7'
  s.dependency 'SwiftLint', '~> 0.1'
end
