//
//  FreedomActivity.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/1/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

open class FreedomActivity: UIActivity {

    var activityBundle: Bundle {
        let path = Bundle(for: FreedomActivity.self).path(forResource: "Freedom", ofType: "bundle") ?? Bundle.main.bundlePath
        return Bundle(path: path) ?? Bundle.main
    }

    var activityURL: URL?

    var callbackURL: URL?

    init(callbackURL: URL?) {
        super.init()
    }
}
