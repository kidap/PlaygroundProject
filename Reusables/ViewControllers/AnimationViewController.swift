//
//  AnimationViewController.swift
//  Reusables
//
//  Created by Karlo Pagtakhan on 11/02/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet var imageView: UIImageView!


    var longText = "The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog"


    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = imageView.frame.height / 2

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pulse))
        imageView.addGestureRecognizer(tapGesture)


        let displayLink = CADisplayLink(target: self, selector: #selector(test))
        displayLink.add(to: .main, forMode: .default)
    }



    @objc func test() {

        guard longText.count > 0 else { return }
        textView.text = textView.text + String(longText.removeFirst())

//        print(textView.text)
//        print(Date())
    }
    @IBAction func restartAnimation(_ sender: Any) {
        longText = "The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog"
        textView.text = ""

    }

    @objc func pulse() {
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: imageView.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor

        view.layer.insertSublayer(pulse, below: imageView.layer)
        print("Image tapped")
    }
}

class Pulsing: CALayer {
    var animationGroup = CAAnimationGroup()

    var initialPulseScale: Float = 0
    var nextPulseAfter: TimeInterval = 0
    var animationDuration: TimeInterval = 0
    var radius: CGFloat = 200
    var numberOfPulses: Float = Float.infinity


    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    init(numberOfPulses: Float = Float.infinity, radius: CGFloat, position: CGPoint) {
        super.init()

        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position

        self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        self.cornerRadius = radius


        DispatchQueue.global(qos: .default).async {
            self.setupAnimationGroup()

            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }

    }

    func createScaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: initialPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration

        return scaleAnimation
    }


    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2, 1]

        return opacityAnimation
    }


    func setupAnimationGroup() {
        animationGroup = CAAnimationGroup()
        animationGroup.duration = animationDuration + nextPulseAfter
        animationGroup.repeatCount = numberOfPulses

        let defaultCurve = CAMediaTimingFunction(name: .default)
        animationGroup.timingFunction = defaultCurve

        animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
    }
}
