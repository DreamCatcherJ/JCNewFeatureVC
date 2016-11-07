Pod::Spec.new do |s|
s.name             = "JCNewFeatureVC"
s.version          = "0.0.4"
s.summary          = "NewFeature Views used on iOS."
s.description      = <<-DESC
It is new feature views used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/DreamCatcherJ/JCNewFeatureVC"
s.license          = 'MIT'
s.author           = { "江嘉荣" => "j_dreamcatcher@163.com" }
s.source           = { :git => "https://github.com/DreamCatcherJ/JCNewFeatureVC.git", :tag => s.version.to_s }

s.platform     = :ios, '7.0'

s.requires_arc = true

s.source_files = 'JCNewFeatureVCDemo/JCNewFeatureVC/**/*'

s.frameworks = 'Foundation', 'UIKit'

end
