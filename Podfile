# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Playground6' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Playground6
  pod 'MessageKit'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'
  pod 'lottie-ios'
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if target.name == 'MessageKit'
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '5.0'
              end
          end
      end
  end

end
