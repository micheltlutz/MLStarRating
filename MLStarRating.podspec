Pod::Spec.new do |s|
 s.name = 'MLStarRating'
 s.version = '1.0.4'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Star Ratings for swift projects'
 s.homepage = 'http://micheltlutz.me'
 s.social_media_url = 'https://twitter.com/michel_lutz'
 s.authors = { "Michel Anderson Lutz Teixeira" => "michel_lutz@icloud.com" }
 s.source = { :git => "https://github.com/micheltlutz/MLStarRating.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "10.0", :tvos => "9.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.framework  = "Foundation"
     ss.framework  = "UIKit"
 end
end
