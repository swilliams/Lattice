//
//  PickerContainerView.swift
//  Lattice
//
//  Created by Scott Williams on 3/11/16.
//  Copyright © 2016 Tallwave. All rights reserved.
//

import UIKit

/**
 A view that holds a `UIPickerView` and displays a toolbar above it. By default, the toolbar contains a `Done` button that dismisses the picker when tapped.
*/
public class PickerContainerView: UIView {

    /// The `Done` button can be either left or right aligned.
    @IBInspectable var buttonAlignment: ToolbarButtonAlignment = .Right

    /// The `UIPickerView` to display. Will need a `dataSource` and a `delegate`.
    public lazy var picker: UIPickerView = { [unowned self] in
        let _picker = UIPickerView()
        _picker.translatesAutoresizingMaskIntoConstraints = false
        return _picker
    }()

    /// The Toolbar above the picker. Contains a `Done` that dismisses the picker.
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

    /// The target for the `Done` button.
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

    /**
     Animates the picker from the bottom up into `parentView`.
     
     -Parameter parentView: View that contains the receiver.
     */
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

    /**
     Animates the receiver out of its `superview` and then removes it.
    */
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
