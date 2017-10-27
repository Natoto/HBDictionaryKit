Pod::Spec.new do |s|
s.name         = "HBDictionaryKit"
s.version      = "1.0.1"
s.summary      = "a good things."
s.homepage     = "https://github.com/Natoto/HBDictionaryKit"
s.license      = "MIT"
s.authors      = { 'nonato ' => '787038442@qq.com'}
s.platform     = :ios,'7.0'
s.source       = { :git => "https://github.com/Natoto/HBDictionaryKit.git", :tag => s.version }
s.source_files = "HBDictionaryKit/**/*.{h,m,plist}"
s.requires_arc = true 
s.dependency 'Masonry'  
end
