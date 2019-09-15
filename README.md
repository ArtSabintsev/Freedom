# Freedom 🦅

### The Freedom to Open URLs in Third-Party Browsers on iOS with Custom UIActivity Subclasses.

![Swift Support](https://img.shields.io/badge/Swift-5.0%2C%204.2%2C%204.1%2C%203.2%2C%203.1-orange.svg)

 [![CocoaPods](https://img.shields.io/cocoapods/v/Freedom.svg)](https://cocoapods.org/pods/Freedom)  [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![SwiftPM Compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)

---

## About

Freedom enables your app to open URLs in third-party browsers that your users have installed on their device.

### Currently Supported
- [Brave Browser](https://itunes.apple.com/us/app/brave-browser-fast-adblocker/id1052879175?mt=8)
- [Dolphin Web Browser](https://itunes.apple.com/gb/app/dolphin-web-browser-fast-internet/id452204407?mt=8)
- [Firefox Web Browser](https://itunes.apple.com/us/app/firefox-web-browser/id989804926?mt=8)
- [Firefox Focus Web Browser](https://itunes.apple.com/us/app/firefox-focus-the-privacy-browser/id1055677337?mt=8)
- [Google Chrome](https://itunes.apple.com/us/app/google-chrome-the-fast-and-secure-web-browser/id535886823?mt=8)
- [Safari](https://www.apple.com/safari/)

## Screenshot

<img src="https://github.com/ArtSabintsev/Freedom/blob/master/screenshot.png?raw=true" height="480">

## Installation Instructions

| Swift Version |  Branch Name  | Will Continue to Receive Updates?
| ------------- | ------------- |  -------------
| 5.1  | swift5.1 | **Yes**
| 5.0  | swift5.0 | No
| 4.2  | swift4.2 | No
| 3.2  | swift4.1 | No
| 3.2  | swift3.2 | No
| 3.1  | swift3.1 | No

### CocoaPods
```ruby
pod 'Freedom' # Swift 5.0
pod 'Freedom', :git => 'https://github.com/ArtSabintsev/Freedom.git', :branch => 'swift5.0' # Swift 5.0
pod 'Freedom', :git => 'https://github.com/ArtSabintsev/Freedom.git', :branch => 'swift4.2' # Swift 4.2
pod 'Freedom', :git => 'https://github.com/ArtSabintsev/Freedom.git', :branch => 'swift4.1' # Swift 4.1
pod 'Freedom', :git => 'https://github.com/ArtSabintsev/Freedom.git', :branch => 'swift3.2' # Swift 3.2
pod 'Freedom', :git => 'https://github.com/ArtSabintsev/Freedom.git', :branch => 'swift3.1' # Swift 3.1
```

### Carthage
```swift
github "ArtSabintsev/Freedom" // Swift 5.1
github "ArtSabintsev/Freedom", "swift5.0" // Swift 5.0
github "ArtSabintsev/Freedom", "swift4.2" // Swift 4.2
github "ArtSabintsev/Freedom", "swift4.1" // Swift 4.1
github "ArtSabintsev/Freedom", "swift3.2" // Swift 3.2
github "ArtSabintsev/Freedom", "swift3.1" // Swift 3.1
```

### Swift Package Manager
```swift
.Package(url: "https://github.com/ArtSabintsev/Freedom.git", majorVersion: 2)
```

## Usage

Open your `Info.plist` file, and add the following URL schemes to the `LSApplicationQueriesSchemes` key:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>brave</string>
  <string>dolphin</string>
  <string>firefox</string>
  <string>firefox-focus</string>
  <string>googlechrome</string>
</array>
```

Add the following code to some actionable/tappable element in your project. In this example, I am using an IBAction from a UIButton.

```swift
@IBAction func openURL(_ sender: UIButton) {

       // A Sample URL that just happens to be my personal website.
       let url = URL(string: "http://www.sabintsev.com")!

       // Enable Debug Logs (disabled by default)
       Freedom.debugEnabled = true

       // Fetch activities for Safari and all third-party browsers supported by Freedom (see screenshot).
       let activities = Freedom.browsers()

       // Alternatively, one could select a specific browser (or browsers).
       // let activities = Freedom.browsers([.chrome])
       let vc = UIActivityViewController(activityItems: [url], applicationActivities: activities)

       present(vc, animated: true, completion: nil)
   }

```

## Notes
 Even if you enable Freedom to support all browsers via `Freedom.browsers()`, only the browsers installed on your users device will be visible to the them in the share sheet (i.e., `UIActivityViewController`). Therefore, it is beneficial to all of your users to initialize Freedom with all supported browsers.

## Created and maintained by
[Arthur Ariel Sabintsev](http://www.sabintsev.com/)
