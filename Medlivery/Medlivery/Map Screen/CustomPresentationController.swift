//
//  CustomPresentationController.swift
//  Medlivery
//
//  Created by Aadesh on 4/5/24.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        
        let size = CGSize(width: containerView.bounds.width, height: 300) 
        
        return CGRect(origin: CGPoint(x: 0, y: containerView.bounds.height - size.height), size: size)
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        guard let containerView = containerView else { return }
        
        let dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.alpha = 0
        containerView.insertSubview(dimmingView, at: 0)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            dimmingView.alpha = 1
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        containerView?.subviews.first?.alpha = 0
    }
}


