//
//  FreedomActivating.swift
//  Freedom
//
//  Created by Sabintsev, Arthur on 7/1/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

import UIKit

protocol FreedomActivating {

    var activityDeepLink: String? { get set }

    var activityURL: URL? { get }

    var callbackURL: URL? { get }

    init(callbackURL: URL?)
    
}
