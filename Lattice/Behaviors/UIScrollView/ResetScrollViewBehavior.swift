//
//  ResetScrollViewBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 2/24/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

/**
 Returns a `UIScrollView` back to its original content offset when the onscreen keyboard disappears.

 ## Usage
 1. Drag an Object onto the scene in Interface Builder
 2. Set its class to `ResetScrollViewBehavior`
 3. Connect the `owner` and `scrollView` outlets

 */

public class ResetScrollViewBehavior: Behavior {
    @IBOutlet weak var scrollView: UIScrollView?
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        scrollView?.contentOffset = CGPointZero
    }
}
