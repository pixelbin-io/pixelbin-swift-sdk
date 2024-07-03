Pod::Spec.new do |s|
s.name         = 'PixelBin'
s.version      = '1.0.1'
s.summary      = 'PixelBin SDKs offer file upload, transformation, optimization, and delivery tools.'
s.description  = <<-DESC
PixelBin SDK wrap REST APIs and include many useful helper methods, allowing you to incorporate comprehensive file upload, transformation, optimization, and delivery capabilities into your application
DESC
s.homepage     = 'https://github.com/pixelbin-io/pixelbin-swift-sdk'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { 'PixelBin' => 'dev@pixelbin.io' }
s.readme = "https://raw.githubusercontent.com/pixelbin-io/pixelbin-swift-sdk/#{s.version.to_s}/README.md"
s.documentation_url = 'https://github.com/pixelbin-io/pixelbin-swift-sdk/blob/main/README.md'
s.source       = { :git => 'https://github.com/pixelbin-io/pixelbin-swift-sdk.git', :tag => s.version.to_s }
    s.platform     = :ios, '14.0'
    s.source_files  = 'Sources/**/*.{swift,h,m}'
    s.swift_versions = ['5.0']
    end
