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
    
    //Step 1: add a scrollView on storyboard and connect the outlet 
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    //Step 2: declare global properties
    let animationView = LOTAnimationView(name: "tutorial")
    let dataSourceArray = ["Swipe left to begin", "Don't forget to make your bed", "Clean your toilet", "And windows", "Make a snack", "And go!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Step 6
        setAnimationView()
    }
    
    //Step 4
    func setAnimationView() {
        
        guard let animationView = self.animationView else { return }
        animationView.frame = CGRect(x: 0, y: 110, width: self.view.frame.size.width, height: 300)
        animationView.contentMode = .scaleAspectFill
        
        view.addSubview(animationView)
        setUpScrollView()
    }
    
    //Step 3
    func setUpScrollView() {
        
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: self.view.frame.width * 6, height: 0)
        
        for i in 0...dataSourceArray.count - 1 {
            
            let labelWidth: CGFloat = 300
            let positionX = ((self.view.frame.width - labelWidth) / 2) + CGFloat(i) * self.view.frame.width
            
            let label = UILabel(frame: CGRect(x: positionX, y: 0, width: labelWidth, height: 30))
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 18, weight: 10)
            label.textColor = .white
            label.text = dataSourceArray[i]
            tutorialScrollView.addSubview(label)
        }
    }
    
}

//Step 5
extension Animation3VC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        
        print("\(scrollView.contentOffset.x) : \(scrollView.contentSize.width)")
        animationView?.animationProgress = progress
    }
    
}













