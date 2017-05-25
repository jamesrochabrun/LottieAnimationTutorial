//
//  AnimationVC3.swift
//  LottieAnimate
//
//  Created by James Rochabrun on 5/24/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class Animation3VC: UIViewController {
    
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    let animationView = LOTAnimationView(name: "tutorial")
    let dataSourceArray = ["Swipe left to begin", "Don't forget to make your bed", "Clean your toilet", "And windows", "Make a snack", "And go!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimationView()
    }
    
    func setAnimationView() {
        
        animationView?.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 300)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        
        view.addSubview(animationView!)
        setUpScrollView()
    }
    
    func setUpScrollView() {
        
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: self.view.frame.width * 6, height: 100)
        
        for i in 0...dataSourceArray.count - 1 {
            
            let labelWidth: CGFloat = 300
            let positionX = tutorialScrollView.center.x + CGFloat(i) * self.view.frame.width - labelWidth / 2
            let positionY = tutorialScrollView.frame.height - 
            
            let label = UILabel(frame: CGRect(x: positionX, y: 80, width: labelWidth, height: 30))
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15, weight: 8)
            label.textColor = .white
            label.text = dataSourceArray[i]
            
            tutorialScrollView.addSubview(label)
        }
    }
    
}

extension Animation3VC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        animationView?.animationProgress = progress
      
    }
    
}













