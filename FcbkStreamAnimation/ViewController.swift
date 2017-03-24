//
//  ViewController.swift
//  FcbkStreamAnimation
//
//  Created by Esso Awesso on 24/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        let curvedView = CurvedView()
//        curvedView.backgroundColor = .white
//        curvedView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        
//        view.addSubview(curvedView)
        
//        let dimension = 20 + drand48() * 10
//        
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "thumbs_up")
//        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
//        
//        let animation = CAKeyframeAnimation(keyPath: "position")
//        animation.duration = 8
//        animation.path = myPath().cgPath
//        animation.fillMode = kCAFillModeForwards
//        animation.isRemovedOnCompletion = false
//        
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        
//        imageView.layer.add(animation, forKey: nil)
//        
//        view.addSubview(imageView)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func handleTap(){
        (0...10).forEach { (_) in
            generateThumb()
        }
    }
    
    func generateThumb(){
        let imageView = UIImageView()
        let imageName = drand48() < 0.5 ? "thumbs_up" : "heart"
        imageView.image = UIImage(named: imageName)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 5 + drand48()*4
        animation.path = myPath().cgPath
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        
        view.addSubview(imageView)
    }
}



func myPath() -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 0, y: 300))
    let endPoint = CGPoint(x:500, y: 300)
    let varY = 200 + drand48()*300
    let cp1 = CGPoint(x: 150, y: 150 - varY)
    let cp2 = CGPoint(x: 300, y: 450 + varY)
    bezierPath.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    return bezierPath
}


class CurvedView: UIView {
    override func draw(_ rect: CGRect) {
        
        let bezierPath = myPath()
        bezierPath.lineWidth = 3
        bezierPath.stroke()
        
    }
    
}
