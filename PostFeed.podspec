Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '13.0'
s.name = "PostFeed"
s.summary = "PostFeed allows for posts of text and an image or just an image."
s.requires_arc = true

# 2
s.version = "1.2.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Ryan Siska" => "rsiska1@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/siska/PostFeed"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/siska/PostFeed.git",
             :tag => "#{s.version}" }

# 7 - no additional cocoapods

# 8
s.source_files = "PostFeed", "PostFeed/**/*.{swift}"

# 9
s.resources = "PostFeed/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5.0"

end

