//
//  BraveFreedomActivity.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/2/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

final class BraveFreedomActivity: UIActivity, FreedomActivating {

    override class var activityCategory: UIActivityCategory {
        return .action
    }

    override var activityImage: UIImage? {
        return UIImage(named: "brave", in: Freedom.bundle, compatibleWith: nil)
    }

    override var activityTitle: String? {
        return "Open in Brave"
    }

    override var activityType: UIActivityType? {
        guard let bundleID = Bundle.main.bundleIdentifier else { return nil }
        let type = bundleID + "." + String(describing: BraveFreedomActivity.self)
        return UIActivityType(rawValue: type)
    }

    var activityDeepLink: String? = "brave://"

    var activityURL: URL?

    var callbackURL: URL?

    init(callbackURL: URL? = nil) {
        super.init()

        self.callbackURL = callbackURL
    }

    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for item in activityItems {

            guard let deepLinkURLString = activityDeepLink,
                let deepLinkURL = URL(string: deepLinkURLString),
                UIApplication.shared.canOpenURL(deepLinkURL) else {
                    return false
            }

            guard let url = item as? URL else {
                return false
            }

            guard url.conformToHypertextProtocol() else {
                return false
            }

            return true
        }

        return false
    }

    override func prepare(withActivityItems activityItems: [Any]) {
        activityItems.forEach { item in
            guard let url = item as? URL else { return }
            guard url.conformToHypertextProtocol() else { return }

            let urlString = url.absoluteString

            guard let escapedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
                let escapedURL = URL(string: escapedURLString) else { return }

            activityURL = escapedURL

            return
        }
    }

    override func perform() {
        guard let activityURL = activityURL else { return activityDidFinish(false) }

        guard let deepLink = activityDeepLink,
            let url = URL(string: deepLink + "open-url?url=" + activityURL.absoluteString) else {
                return activityDidFinish(false)
        }

        UIApplication.shared.open(url, options: [:]) { [unowned self] opened in
            guard opened else {
                return self.activityDidFinish(false)
            }
        }
        
        activityDidFinish(true)
    }
}
