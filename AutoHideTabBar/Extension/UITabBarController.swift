//
//  Ext UITabBarController.swift
//  AutoHideTabBar
//
//  Created by iSal on 20/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController{
    func setTabBar(
        hidden: Bool
    ) {
        guard isTabBarHidden != hidden else { return }
        
        let offsetY = hidden ? tabBar.frame.height : -tabBar.frame.height
        let endFrame = tabBar.frame.offsetBy(dx: 0, dy: offsetY)
        let cvc: UIViewController? = viewControllers?[selectedIndex]
        var newInsets: UIEdgeInsets?
        if #available(iOS 11.0, *) {
            newInsets = cvc?.additionalSafeAreaInsets
        }
        
        weak var tabBarRef = self.tabBar
        UIView.animate(withDuration: 0.1, animations: {
            
        }, completion: { isFinished in
            var height: CGFloat = 0
            if #available(iOS 11.0, *) {
                height = UIDevice.current.hasNotch ? offsetY + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0) : offsetY
            } else {
                height = offsetY
            }
            newInsets?.bottom -= height
            if #available(iOS 11.0, *) {
                cvc?.additionalSafeAreaInsets = newInsets!
            } else {
                cvc?.view.frame = CGRect(x: 0, y: 0,
                                         width: cvc?.view.frame.width ?? 0.00,
                                         height: (cvc?.view.frame.height ?? 0.00) + height)
            }
            if isFinished {
                UIView.animate(withDuration: 0.2, animations: {
                    tabBarRef?.frame = endFrame
                }, completion: nil)
            }
        })
    }

    var isTabBarHidden: Bool {
        return !tabBar.frame.intersects(view.frame)
    }

}
