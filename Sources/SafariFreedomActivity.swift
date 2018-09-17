//
//  SafariFreedomActivity.swift
//  Freedom
//
//  Created by Arthur Sabintsev on 7/3/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

final class SafariFreedomActivity: UIActivity, FreedomActivating {

    override class var activityCategory: UIActivity.Category {
        return .action
    }

    override var activityImage: UIImage? {
        return UIImage(named: "safari", in: Freedom.bundle, compatibleWith: nil)
    }

    override var activityTitle: String? {
        return "Open in Safari"
    }

    override var activityType: UIActivity.ActivityType? {
        guard let bundleID = Bundle.main.bundleIdentifier else {
            Freedom.printDebugMessage("Failed to fetch the bundleID.")
            return nil
        }

        let type = bundleID + "." + String(describing: SafariFreedomActivity.self)
        return UIActivity.ActivityType(rawValue: type)
    }

    var activityDeepLink: String?

    var activityURL: URL?

    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for item in activityItems {

            guard let url = item as? URL else {
                continue
            }

            guard url.conformToHypertextProtocol() else {
                Freedom.printDebugMessage("The URL scheme is missing. This happens if a URL does not contain `http://` or `https://`.")
                return false
            }

            Freedom.printDebugMessage("The user has the Safari Web Browser installed.")
            return true
        }

        return false
    }

    override func prepare(withActivityItems activityItems: [Any]) {
        activityItems.forEach { item in
            guard let url = item as? URL, url.conformToHypertextProtocol() else {
                return Freedom.printDebugMessage("The URL scheme is missing. This happens if a URL does not contain `http://` or `https://`.")
            }
            
            activityURL = url
            return
        }
    }

    override func perform() {
        guard let activityURL = activityURL else {
            Freedom.printDebugMessage("activityURL is missing.")
            return activityDidFinish(false)
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(activityURL, options: [:]) { [weak self] opened in
                guard let strongSelf = self else { return }

                guard opened else {
                    return strongSelf.activityDidFinish(false)
                }

                Freedom.printDebugMessage("The user successfully opened the url, \(activityURL.absoluteString), in the Safari Web Browser.")
            }
        } else {
            UIApplication.shared.openURL(activityURL)
            Freedom.printDebugMessage("The user successfully opened the url, \(activityURL.absoluteString), in the Safari Web Browser.")
        }
        
        activityDidFinish(true)
    }
}

