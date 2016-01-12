Pod::Spec.new do |s|
s.name             = "guide"
s.version          = "1.0.2"
s.summary          = "Guide views used on iOS."
s.description      = <<-DESC
It is guide views used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/DreamCatcherJ/guide"
s.license          = 'MIT'
s.author           = { "江嘉荣" => "j_dreamcatcher@163.com" }
s.source           = { :git => "https://github.com/DreamCatcherJ/guide.git", :tag => s.version.to_s }

s.platform     = :ios, '7.0'

s.requires_arc = true

s.source_files = 'guide/*'

s.frameworks = 'Foundation', 'UIKit'

end
