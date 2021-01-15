Pod::Spec.new do |spec|

  spec.name         = "OkraWidget"
  spec.version      = "4.0.2"
  spec.summary      = "This is the Okra ios widget."
  spec.description  = "This framework allows you to integrate the Okra widget into your ios application in no time."
  spec.homepage     = "https://github.com/okraHQ/okra-ios-sdk"
  spec.license      = "MIT"
  spec.author       = { "beshiett" => "beshiett@okra.ng" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/okraHQ/okra-ios-sdk.git", :tag => "v4.0" }
    spec.source_files = 'OkraWidget/Classes/**/*'
  spec.swift_version = "5.1"

end
