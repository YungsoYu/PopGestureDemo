//
//  BaseNavigationController.swift
//  PopGesture
//
//  Created by youngseo on 2021/07/14.
//  Copyright © 2021 youngseo. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    private var duringTransition = false
    private var disabledPopVCs = [CViewController.self]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        duringTransition = true
        
        super.pushViewController(viewController, animated: animated)
    }
    
}

extension BaseNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        self.duringTransition = false
    }
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer,
              let topVC = topViewController else {
            return true // default value
        }
        
        return viewControllers.count > 1 && duringTransition == false && isPopGestureEnable(topVC)
    }
    
    private func isPopGestureEnable(_ topVC: UIViewController) -> Bool {
        for vc in disabledPopVCs {
            if String(describing: type(of: topVC)) == String(describing: vc) {
                return false
            }
        }
        return true
    }
}
