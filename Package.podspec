Pod::Spec.new do |s|
s.name         = 'YourLibrary'
s.version      = '0.1.0'
s.summary      = 'A short description of YourLibrary.'
s.description  = <<-DESC
A longer description of YourLibrary.
DESC
s.homepage     = 'https://github.com/yourusername/YourLibrary'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { 'Your Name' => 'your.email@example.com' }
s.source       = { :git => 'https://github.com/yourusername/YourLibrary.git', :tag => s.version.to_s }
    s.platform     = :ios, '10.0'
    s.source_files  = 'Sources/**/*.{swift,h,m}'
    end
