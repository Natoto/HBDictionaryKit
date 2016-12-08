Pod::Spec.new do |s|
s.name         = "UIDictionaryKit"
s.version      = "0.1.3"
s.summary      = "A  Fast Style TableViewController."
s.homepage     = "https://github.com/Natoto/UIDictionaryKit"
s.license      = "MIT"
s.authors      = { 'nonato ' => '787038442@qq.com'}
s.platform     = :ios,'7.0'
s.source       = { :git => "https://github.com/Natoto/UIDictionaryKit.git", :tag => s.version }
s.source_files = "UIDictionaryKit/**/*.{h,m,plist}"
s.requires_arc = true 
s.dependency 'Masnory'  
end
