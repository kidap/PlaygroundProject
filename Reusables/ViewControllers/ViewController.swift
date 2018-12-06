//
//  ViewController.swift
//  Reusables
//
//  Created by Karlo Pagtakhan on 10/22/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var butttonView: UIView!
    var buttonChildViewController: ButtonChildViewController!

    @IBOutlet var imageView: CachedImageView!
    @IBOutlet var imageURLTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonChildViewController = ButtonChildViewController()

        addChild(buttonChildViewController, toSubview: butttonView)
    }

    @IBAction func onSwiftValueChanged(_ switchElement: UISwitch) {
        buttonChildViewController.setEnable(switchElement.isOn)
    }

    @IBAction func downloadImage(_ sender: Any) {
        imageView.loadImage(fromURL: imageURLTextField.text ?? "")

    }
}
