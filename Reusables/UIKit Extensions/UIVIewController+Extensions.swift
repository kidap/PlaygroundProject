//
//  UIVIewController Extensions.swift
//  Reusables
//
//  Created by Karlo Pagtakhan on 10/22/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

extension UIViewController {

    func addChild(_ childViewController: UIViewController, toSubview destinationView: UIView, belowView: UIView? = nil, useSafeArea: Bool = true) {
        addChild(childViewController)

        childViewController.didMove(toParent: self)

        guard let childView = childViewController.view else { return }

        if let belowView = belowView {
            destinationView.insertSubview(childView, belowSubview: belowView)
            destinationView.anchor(subView: childView, useSafeArea: useSafeArea)
        } else {
            destinationView.addAndAnchor(childView)
        }
    }
}

