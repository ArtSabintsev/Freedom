//
//  ViewController.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/1/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import Freedom
import UIKit

class ViewController: UIViewController {

    @IBAction func openURL(_ sender: UIButton) {

        // A Sample URL that just happens to be my personal website.
        let url = URL(string: "http://www.sabintsev.com")!

        // Enable Debug Logs (disabled by default)
        Freedom.debugEnabled = true

        // Fetch activities for Safari and all third-party browsers supported by Freedom.
        let activities = Freedom.browsers()

        // Alternatively, one could select a specific browser (or browsers).
//        let activities = Freedom.browsers([.chrome])

        let viewController = UIActivityViewController(activityItems: [url], applicationActivities: activities)
        present(viewController, animated: true, completion: nil)

    }

}
