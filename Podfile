# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'SampleApp'

def sampleModule_pods
  pod 'SampleModule', :path => 'Modules/SampleModule'
end

target 'SampleApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SampleApp
  pod "Resolver"

end

target 'SampleAppPro' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SampleAppPro
   pod "Resolver"
  sampleModule_pods

end
target 'SampleModule_Example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SampleModule
  project 'Modules/SampleModule/Example/SampleModule.xcodeproj'
  sampleModule_pods

end

target 'SampleAppTests' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SampleAppPro
   pod "Resolver"
end
