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
            if let superview = self.superview {
                translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activateConstraints([
                    self.leadingAnchor.constraintEqualToAnchor(superview.leadingAnchor),
                    self.trailingAnchor.constraintEqualToAnchor(superview.trailingAnchor),
                    self.bottomAnchor.constraintEqualToAnchor(superview.bottomAnchor),
                    self.heightAnchor.constraintEqualToConstant(height)
                    ])
            }
        }
    }

    private var height: CGFloat {
        return picker.frame.height + toolbar.frame.height
    }



    public func animateIntoParentView(parentView: UIView) {
        parentView.addSubview(self)
        layoutSubviews()

        // Animate by using CGAffineTransform
        let offset = CGAffineTransformMakeTranslation(0, height)
        transform = offset

        UIView.animateWithDuration(Util.AnimationValues.duration,
            delay: 0,
            usingSpringWithDamping: Util.AnimationValues.damping,
            initialSpringVelocity: Util.AnimationValues.velocity,
            options: .CurveEaseInOut,
            animations: { [unowned self] in

            self.transform = CGAffineTransformIdentity

            }, completion: nil)
    }

    public func animateOut() {
        UIView.animateWithDuration(Util.AnimationValues.duration,
            delay: 0,
            usingSpringWithDamping: Util.AnimationValues.damping,
            initialSpringVelocity: Util.AnimationValues.velocity,
            options: .CurveEaseInOut,
            animations: { [unowned self] in
                let offset = CGAffineTransformMakeTranslation(0, self.height)
                self.transform = offset

            }, completion: { [weak self] completion in
                self?.removeFromSuperview()
        })
    }

}
