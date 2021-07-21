#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ${POD_NAME}.'
  s.description      = <<-DESC
Description of the module
                       DESC

  s.homepage         = 'https://www.new-gravity.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '${USER_NAME}' => '${USER_EMAIL}' }
  s.source           = { :git => 'https://www.new-gravity.com', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = '${POD_NAME}/Module/**/*.{swift}'
  s.resources = "${POD_NAME}/Module/**/*.{xcassets,json,storyboard,xib,xcdatamodeld,strings,lproj}"
#  s.dependency 'RxSwift'

  
  s.test_spec 'Tests' do |test_spec|
      test_spec.source_files = '${POD_NAME}/Tests/**/*.{swift}'
#      test_spec.dependency 'RxTest'
  end
end
