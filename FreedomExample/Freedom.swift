//
//  Freedom.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/1/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

protocol Freedom {

    var activityTitle: String { get }
    var activityImage: UIImage { get }
//    var activityURL: URL { get }


    init(withURL with: URL)


}
