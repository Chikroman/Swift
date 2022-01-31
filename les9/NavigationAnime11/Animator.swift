//
//  Animator.swift
//  NavigationAnime11
//
//  Created by Rodion Molchanov on 28.01.2022.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
    }

    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let pi = CGFloat(M_PI)
        
        
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else {return}
        
//
//        let containerFrame = transitionContext.containerView.frame
        source.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
        destination.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
        source.view.layer.position = CGPoint(x: 0, y: 0)
        destination.view.layer.position = CGPoint(x: 0, y: 0)
        destination.view.transform = CGAffineTransform(rotationAngle:-pi/2)
        transitionContext.containerView.addSubview(destination.view)
        UIView.animate(withDuration: 3) {
            source.view.transform = CGAffineTransform(rotationAngle: pi/2)
            destination.view.transform = CGAffineTransform(rotationAngle:pi/2)
        } completion: { _ in
            transitionContext.completeTransition(true)
        }

//        transitionContext.containerView.addSubview(destination.view)
//        destination.view.frame = CGRect(x: source.view.frame.width / 2, y: source.view.frame.height / 2, width: 0, height: 0)
//
//        UIView.animate(withDuration: transitionDuration(using: transitionContext) / 2) {
//            source.view.frame = destination.view.frame
//        } completion: { isSuccess in
//            if isSuccess {
//                UIView.animate(withDuration: self.transitionDuration(using: transitionContext) / 2) {
//                    destination.view.frame = containerFrame
//                } completion: {isSuccessfully in
//                    if isSuccessfully{
//                        transitionContext.completeTransition(isSuccessfully)
//                    }
//                }
//            }
//        }
    }
    

    
    
    
}
