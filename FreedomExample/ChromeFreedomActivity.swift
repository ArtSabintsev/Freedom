//
//  ChromeFreedomActivity.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/1/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

final class ChromeFreedomActivity: FreedomActivity {

    override class var activityCategory: UIActivityCategory {
        return .action
    }

    override var activityImage: UIImage? {
        return UIImage(named: "chrome", in: activityBundle, compatibleWith: nil)
    }

    override var activityTitle: String? {
        return "Open in Chrome"
    }

    override var activityType: UIActivityType? {
        guard let bundleID = Bundle.main.bundleIdentifier else { return nil }
        let type = bundleID + "." + String(describing: ChromeFreedomActivity.self)
        return UIActivityType(rawValue: type)
    }

    var secureDeepLink: String {
        return "googlechromes:"
    }

    var unsecureDeepLink: String {
        return "googlechrome:"
    }

    override init(callbackURL: URL? = nil) {
        super.init(callbackURL: callbackURL)

        self.callbackURL = callbackURL
    }

    override func prepare(withActivityItems activityItems: [Any]) {
        activityItems.forEach { item in
            guard let url = item as? URL else { return }
            guard url.scheme == "http" || url.scheme == "https" else { return }

            let urlString = url.absoluteString

            guard let escapedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
                let escapedURL = URL(string: escapedURLString) else { return }

            activityURL = escapedURL

            return
        }
    }

    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for item in activityItems {
            guard let url = item as? URL else { return false }
            guard url.scheme == "http" || url.scheme == "https" else { return false }

            return true
        }

        return false
    }

    override func perform() {
        guard let activityURL = activityURL else { return }

        guard let scheme = activityURL.scheme else { return }

        var deepLink: String = "" // This will default to Safari App.

        switch scheme {
        case "http":
            deepLink = unsecureDeepLink
        case "https":
            deepLink = secureDeepLink
        default:
            break
        }

        guard let formattedURL = activityURL.withoutScheme(),
            let url = URL(string: deepLink + formattedURL.absoluteString) else {
                return
        }

        UIApplication.shared.open(url, options: [:]) { opened in
            guard opened else {
                return
            }
        }

        activityDidFinish(true)
    }

}

private extension URL {

    func withoutScheme() -> URL? {
        let components = NSURLComponents(url: self, resolvingAgainstBaseURL: false)
        components?.scheme = nil

        return components?.url
    }

}
