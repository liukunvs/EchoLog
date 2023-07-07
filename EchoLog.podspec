Pod::Spec.new do |s|
  s.name             = "EchoLog"
  s.version          = "1.0.0"
  s.summary          = "Echooo log package"
  s.homepage         = "https://github.com/liukunvs/EchoLog.git"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "liukun" => "liukun@valleysound.xyz" }
  s.source           = { :git => "https://github.com/liukunvs/EchoLog.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources"
  s.frameworks       = 'Foundation'
  s.requires_arc     = true
  s.swift_version    = "5.0"

  s.ios.deployment_target = "13.0"
  s.dependency 'SwiftyBeaver', '~> 2.0'
end
