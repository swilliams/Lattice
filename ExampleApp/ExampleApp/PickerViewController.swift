//
//  PickerViewController.swift
//  ExampleApp
//
//  Created by Scott Williams on 3/11/16.
//  Copyright © 2016 Scott Williams. All rights reserved.
//

import UIKit
import Lattice


class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        let pickerContainer = PickerContainerView()
        pickerContainer.picker.delegate = self
        pickerContainer.picker.dataSource = self
        pickerContainer.animateIntoParentView(view)
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Row \(row)"
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
}
