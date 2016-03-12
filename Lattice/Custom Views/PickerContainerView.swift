//
//  PickerContainerView.swift
//  Lattice
//
//  Created by Scott Williams on 3/11/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

public class PickerContainerView: UIView {

    @IBInspectable var buttonAlignment: ToolbarButtonAlignment = .Right

    public lazy var picker: UIPickerView = { [unowned self] in
        let _picker = UIPickerView()
        _picker.translatesAutoresizingMaskIntoConstraints = false
        return _picker
    }()

    public lazy var toolbar: AccessoryBar = { [weak self] in
        let toolbar = AccessoryBar()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneTapped:")
        var buttons: [UIBarButtonItem] = [doneButton]
        if self?.buttonAlignment == .Right {
            let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            buttons.insert(spacer, atIndex: 0)
        }
        toolbar.items = buttons
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    func doneTapped(sender: AnyObject) {
        animateOut()
    }

    public override func layoutSubviews() {
        addSubview(picker)
        addSubview(toolbar)
        if #available(iOS 9.0, *) {
        NSLayoutConstraint.activateConstraints([
            picker.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor),
            picker.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor),
            picker.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor),
            toolbar.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor),
            toolbar.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor),
            toolbar.topAnchor.constraintEqualToAnchor(self.topAnchor)
            ])
        }
    }

    public func animateIntoParentView(parentView: UIView) {
        let height = picker.frame.height + toolbar.frame.height
        parentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activateConstraints([
                self.leadingAnchor.constraintEqualToAnchor(parentView.leadingAnchor),
                self.trailingAnchor.constraintEqualToAnchor(parentView.trailingAnchor),
                self.bottomAnchor.constraintEqualToAnchor(parentView.bottomAnchor),
                self.heightAnchor.constraintEqualToConstant(height)
                ])
        } else {
            // Fallback on earlier versions
        }
    }

    public func animateOut() {
        removeFromSuperview()
    }

}
