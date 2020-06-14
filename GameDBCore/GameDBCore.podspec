#
# Be sure to run `pod lib lint base.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GameDBCore'
  s.version          = '1.0.0'
  s.summary          = 'Core GameDB App'

  s.description      = 'Core library for GameDB Application'

  s.homepage         = 'https://github.com/dwirandyh'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = 'MIT (iOS)'
  s.author           = { 'Dwi Randy Herdinanto' => 'dwirandyherdinanto@gmail.com' }
  s.source           = { :git => 'https://github.com/dwirandyh/ios-dicoding-submission-pemula.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'GameDBCore/**/*.{h,m,swift}'
  s.resource_bundles = {
     'GameDBCore' => ['GameDBCore/**/*.{storyboard,xib,xcassets,json,imageset,png}']
  }

  #s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'RxSwift', '~> 5'
  s.dependency 'RxCocoa', '~> 5'
  s.dependency 'RxAlamofire'
  s.dependency 'Swinject'


end
