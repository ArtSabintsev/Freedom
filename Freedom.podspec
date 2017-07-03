Pod::Spec.new do |s|
  s.name         = "Freedom"
  s.version      = "1.0.0"
  s.summary      = "The Freedom to Open URLs in Third-Party Browsers on iOS with these Custom UIActivity Subclasses."

  s.description  = <<-DESC
Freedom enables you to add the ability to open URLs in third-party browsers from within your app.
                   DESC

  s.homepage     = "https://github.com/ArtSabintsev/Freedom"
  s.license      = "MIT"
  s.author       = { "Arthur Ariel Sabintsev" => "arthur@sabintsev.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ArtSabintsev/Siren.git", :tag => s.version.to_s }
  s.source_files = 'Sources/*.swift'
  s.resources    = 'Sources/Freedom.bundle'
  s.requires_arc = true

end
