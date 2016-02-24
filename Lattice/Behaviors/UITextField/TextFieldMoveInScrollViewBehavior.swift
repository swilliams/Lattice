//
//  TextFieldMoveInScrollViewBehavior.swift
//  Lattice
//
//  Created by Scott Williams on 2/24/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

public class TextFieldSlideInScrollViewBehavior: TextFieldBehavior {
    @IBOutlet public weak var scrollView: UIScrollView?
    
    public func textFieldDidBeginEditing(textField: UITextField) {
        guard let scrollView = scrollView else { return }
        let scrolledOffset = CGPoint(x: 0, y: textField.frame.origin.y)
        scrollView.contentOffset = scrolledOffset
    }
    
}

