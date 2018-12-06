//
//  ButtonChildViewController.swift
//  Reusables
//
//  Created by Karlo Pagtakhan on 10/22/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class ButtonChildViewController: UIViewController {
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setEnable(_ value: Bool) {
        button.isEnabled = value
    }

    func enableButton() {
        button.isEnabled = true
    }

    func disableButton() {
        button.isEnabled = false
    }

    func togglerButton() {
        button.isEnabled = !button.isEnabled
    }
}
