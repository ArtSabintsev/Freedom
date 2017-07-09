Pod::Spec.new do |s|
  s.name         = "Freedom"
  s.version      = "1.0.5"
  s.summary      = "The Freedom to Open URLs in Third-Party Browsers on iOS with Custom UIActivity Subclasses."

  s.description  = <<-DESC
Freedom enables your app to open URLs in third-party browsers via the share sheet. Freedom currently supports the Brave, Chrome, and Firefox browsers.
                   DESC

  s.homepage     = "https://github.com/ArtSabintsev/Freedom"
  s.license      = "MIT"
  s.author       = { "Arthur Ariel Sabintsev" => "arthur@sabintsev.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ArtSabintsev/Freedom.git", :tag => s.version.to_s }
  s.source_files = 'Sources/*.swift'
  s.resources    = 'Sources/Freedom.bundle'
  s.requires_arc = true

end
