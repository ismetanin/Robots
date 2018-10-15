platform :ios, '10.0'

inhibit_all_warnings!

def utils
    pod 'SwiftGen', '~> 5.2.1'
    pod 'SwiftLint', '~> 0.25.0'
end

target 'Robots' do

    use_frameworks!

    utils
    pod 'Nuke', '~> 7.3.2'
    pod 'PinLayout', '~> 1.7.0'
    pod 'RealmSwift', '~> 3.11.0'

    target 'RobotsTests' do
    	pod 'RealmSwift', '~> 3.11.0'
    end

end

                
