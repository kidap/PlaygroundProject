//
//  UIView Extensions.swift
//  Reusables
//
//  Created by Karlo Pagtakhan on 10/22/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

extension UIView {

    func addAndAnchor(_ subview: UIView, useSafeArea: Bool = true) {
        addSubview(subview)

        anchor(subView: subview, useSafeArea: useSafeArea)

    }

    func anchor(subView: UIView, useSafeArea: Bool = true) {
        subView.translatesAutoresizingMaskIntoConstraints = false

        if useSafeArea {
            subView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
            subView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
            subView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
            subView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        } else {
            subView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            subView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            subView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            subView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    }
}
