//
//  ColorView.swift
//  Reusables
//
//  Created by Karlo Pagtakhan on 12/05/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class ColorView: UIView {

    fileprivate var view: UIView!

    // MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXib()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ColorView", bundle: bundle)

        view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.red.cgColor
    }

}
