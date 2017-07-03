# Freedom 🦅

The Freedom to Open URLs in Third-Party Browsers on iOS with these Custom UIActivity Subclasses.

## About

Freedom enables your application to open URLs in third-party browsers that your users have installed on your device.

Freedom currently supports:
- [Brave Browser](https://itunes.apple.com/us/app/brave-browser-fast-adblocker/id1052879175?mt=8)
- [Firefox Web Browser](https://itunes.apple.com/us/app/firefox-web-browser/id989804926?mt=8)
- [Google Chrome](https://itunes.apple.com/us/app/google-chrome-the-fast-and-secure-web-browser/id535886823?mt=8)

## Screenshot

<img src="https://github.com/ArtSabintsev/Freedom/blob/master/screenshot.png?raw=true" height="480">

## Installation Instructions

### CocoaPods
For Swift 3 support:
```ruby
pod 'Freedom'
```

For Swift 4 support:
```ruby
pod 'Freedom', :git => 'https://github.com/ArtSabintsev/Freedom.git', :branch => 'swift4'
```

### Carthage
For Swift 3 support:

```swift
github "ArtSabintsev/Freedom"
```

For Swift 4 support:
```swift
github "ArtSabintsev/Freedom", "swift4"
```

### Swift Package Manager
```swift
.Package(url: "https://github.com/ArtSabintsev/Freedom.git", majorVersion: 1)
```

## Usage

Open your `Info.plist` file, and add the following URL schemes to the `LSApplicationQueriesSchemes` key:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>googlechrome</string>
  <string>firefox</string>
  <string>brave</string>
</array>
```

Add the following code to some actionable/tappable element in your project. In this example, I am using an IBAction from a UIButton.

```swift
@IBAction func openURL(_ sender: UIButton) {

       // A Sample URL that just happens to be my personal website.
       let url = URL(string: "http://www.sabintsev.com")!

       // Enable Debug Logs (disabled by default)
       Freedom.debugEnabled = true

       // Fetch activities for all third-party browsers supported by Freedom.
       let activities = Freedom.browsers()

       // Alternatively, one could select a specific browser (or browsers)
       // let activities = Freedom.browsers([.chrome])

       let vc = UIActivityViewController(activityItems: [url], applicationActivities: activities)

       present(vc, animated: true, completion: nil)
   }

```

## Notes
 Even if you enable Freedom to support all browsers via `Freedom.browsers()`, only the browsers installed on your users device will be visible to the them in the share sheet (i.e., `UIActivityViewController`). Therefore, it is beneficial to all of your users to initialize Freedom with all supported browsers.

## Created and maintained by
[Arthur Ariel Sabintsev](http://www.sabintsev.com/)
