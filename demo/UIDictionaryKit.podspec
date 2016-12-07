Pod::Spec.new do |s|
s.name         = "UIDictionaryKit"
s.version      = "0.0.1"
s.summary      = "use uikit with dictionary or plist."
s.homepage     = "https://github.com/Natoto/UIDictionaryKit"
s.license      = "MIT"
s.authors      = { 'nonato ' => '787038442@qq.com'}
s.platform     = :ios, "6.0"
s.source       = { :git => "https://github.com/Natoto/UIDictionaryKit.git", :tag => s.version }
s.source_files = "UIDictionaryKit/*.{h,m,plist}"
s.requires_arc = true
end
