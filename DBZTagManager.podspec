#
# Be sure to run `pod lib lint DBZTagManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DBZTagManager'
  s.version          = '0.1.1'
  s.summary          = 'This is the base tagging framework for the dubizzle iOS app'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DBZTagManager framework is the core component of dubizzle iOS app for tagging across all verticals and the horizontal.
                       DESC

  s.homepage         = 'https://github.com/hishamdubizzle/tagging_demo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ahmedomer' => 'ahmed.omer@hotmail.com' }
  s.source           = { :git => 'https://github.com/hishamdubizzle/tagging_demo.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  s.static_framework = true
  
  s.libraries = 'sqlite3.tbd'

  s.source_files = 'DBZTagManager', 'DBZTagManager/**/*.{h,m,swift}'
  

  
  # s.resource_bundles = {
  #   'DBZTagManager' => ['DBZTagManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Apptimize', '2.20.20'
  s.dependency 'FBSDKCoreKit', '4.23.0'
  s.dependency 'NCNinja'
  s.dependency 'SnowplowTracker', '0.6.2'
  
end
