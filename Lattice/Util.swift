//
//  Util.swift
//  Lattice
//
//  Created by Scott Williams on 7/24/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit

struct Util {
    static var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.width
    }

    struct AnimationValues {
        static let duration: NSTimeInterval = 0.33
        static let damping: CGFloat = 0.6
        static let velocity: CGFloat = 0.5
    }
}
