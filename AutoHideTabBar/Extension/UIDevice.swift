//
//  UIDevice.swift
//  AutoHideTabBar
//
//  Created by iSal on 20/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
