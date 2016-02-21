//
//  TextFieldBehaviorContainerTests.swift
//  Lattice
//
//  Created by Scott Williams on 7/11/15.
//  Copyright (c) 2015 Tallwave. All rights reserved.
//

import UIKit
import XCTest
import Lattice

class TextFieldBehaviorContainerTests: XCTestCase {

    func testBehaviorsAreNotImmediatelyReleased() {
        let container = TextFieldBehaviorContainer()
        let behavior = TextFieldBehavior()

        container.addBehavior(behavior)
        XCTAssertNotNil(behavior)
        XCTAssertEqual(1, container.behaviorCount)
    }
}
