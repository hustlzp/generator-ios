//
//  Constants.swift
//  FengYe
//
//  Created by 刘志鹏 on 16/11/30.
//  Copyright © 2016年 刘志鹏. All rights reserved.
//

import Foundation
import UIKit

class Color: NSObject {
    static let mainColor = UIColor(hex: 0xCE2323FF)
    static let borderColor = UIColor(hex: 0xDDDDDDFF)
    static let tableViewCellSeparatorColor = UIColor(hex: 0xE5E5E5ff)
}

struct Size {
    static let statusBarHeight: CGFloat = 20
    static let navigationBarHeight: CGFloat = 64
    static let navigationBarWithoutStatusHeight = navigationBarHeight - statusBarHeight
    static let tabBarHeight: CGFloat = 49
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenMaxLength = max(Size.screenWidth, Size.screenHeight)
    static let horizonalGap: CGFloat = 20

}

struct UserDefaultsKey {
    static let location = "location"

}

struct NotificationKey {
    static let didCreateCouplet = "didCreateCouplet"
    
}
