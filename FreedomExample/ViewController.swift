//
//  ViewController.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/1/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func openURL(_ sender: UIButton) {
        let url = URL(string: "http://www.sabintsev.com")!
        let activities = [ChromeFreedomActivity(), FirefoxFreedomActivity()]
        let vc = UIActivityViewController(activityItems: [url], applicationActivities: activities)
        present(vc, animated: true, completion: nil)
    }

}

