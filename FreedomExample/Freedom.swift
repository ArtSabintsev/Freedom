//
//  Freedom.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/2/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import Foundation

final class Freedom {

    static var bundle: Bundle {
        let path = Bundle(for: Freedom.self).path(forResource: "Freedom", ofType: "bundle") ?? Bundle.main.bundlePath
        return Bundle(path: path) ?? Bundle.main
    }

}
