Pod::Spec.new do |s|
s.name             = "Crotalus"
s.version          = "0.2.1"
s.summary          = "Elegant approach to deal with AttributedString"
s.description      = <<-DESC
This repo providing an elegant approach to manipulate attributed string in swift. It is extremely painful for us deal with attributed string during iOS development. And I would like to provide a repo like ruby-syntax to make it easier.
DESC

s.homepage         = "https://github.com/Draveness/Crotalus"
s.license          = 'MIT'
s.author           = { "Draveness" => "stark.draven@gmail.com" }
s.source           = { :git => "https://github.com/Draveness/Crotalus.git", :tag => s.version.to_s }
s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'
s.resource_bundles = {
'Snake' => ['Pod/Assets/*.png']
}

# s.public_header_files = 'Pod/Classes/**/*.h'
end
