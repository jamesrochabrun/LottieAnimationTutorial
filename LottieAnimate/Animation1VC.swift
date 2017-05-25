//
//  ViewController.swift
//  LottieAnimate
//
//  Created by James Rochabrun on 5/22/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
import Lottie

class Animation1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showAnimation(_ sender: Any) {
        
        //this is all you need for basic animation
        guard let animationView = LOTAnimationView(name: "ball") else {
            return
        }
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.loopAnimation = true
        animationView.animationSpeed = 0.8
        
        //uncomment this line if want to perform scale or rotation
        //transform(animationView)
        
        view.addSubview(animationView)
        animationView.play()
    }

    func transform(_ animationView: LOTAnimationView) {

        //switch between the effect that you want, from rotation to scale or concatenate both.
        //let rotateTransform = CGAffineTransform(rotationAngle: 45.0)
        //animationView.transform = rotateTransform
        
        let minimizeTransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        animationView.transform = minimizeTransform
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            animationView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
