//
//  Freedom.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/2/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

final class Freedom {

    /// Third-Party Browsers Supported by Freedom
    ///
    /// - brave: Brave Browser (https://itunes.apple.com/us/app/brave-browser-fast-adblocker/id1052879175?mt=8)
    /// - chrome: Google Chrome (https://itunes.apple.com/us/app/google-chrome-the-fast-and-secure-web-browser/id535886823?mt=8)
    /// - firefox: Firefox Web Browser (https://itunes.apple.com/us/app/firefox-web-browser/id989804926?mt=8)
    public enum Browser {
        case brave
        case chrome
        case firefox

        static var all: [Browser] {
            return [.brave, .chrome, .firefox]
        }
    }

    /// An array of `UIActivity` instances that represent third-party browsers that
    /// can be used to open URLs in an instance of `UIActivityViewController`.
    ///
    /// - Parameter browsers: An array of `Browsers`. Defaults to all supported browsers if no parameters are provided.
    /// - Returns: Returns an array of UIActivities that the consumer would like to support in their app.
    public static func browsers(_ browsers: [Browser] = Browser.all) -> [UIActivity] {
        var activities: [UIActivity] = []

        if browsers.contains(.brave) {
            activities.append(BraveFreedomActivity())
        }

        if browsers.contains(.chrome) {
            activities.append(ChromeFreedomActivity())
        }

        if browsers.contains(.firefox) {
            activities.append(FirefoxFreedomActivity())
        }

        return activities
    }

}

// MARK: - Helpers

extension Freedom {

    /// References Freedom.bundle, which contains images for the various browser UIActivity instances.
    static var bundle: Bundle {
        let path = Bundle(for: Freedom.self).path(forResource: "Freedom", ofType: "bundle") ?? Bundle.main.bundlePath
        return Bundle(path: path) ?? Bundle.main
    }

}
