//
//  ClearViewController.swift
//  ExampleApp
//
//  Created by Scott Williams on 2/21/16.
//  Copyright © 2016 Scott Williams. All rights reserved.
//

import UIKit

class ClearViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let nav = navigationController {
            let newStack: [UIViewController] = [self]
            nav.viewControllers = newStack
            print("clear")
        }
    }


}
