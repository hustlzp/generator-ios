//
//  UIImage+Helper.swift
//  SpringFestival
//
//  Created by 刘志鹏 on 2017/1/14.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    class func create(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        context.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func resize(maxBorder: CGFloat) -> UIImage {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        if self.size.width > self.size.height && self.size.width > maxBorder {
            width = maxBorder
            height = width / self.size.width * self.size.height
            
            
            UIGraphicsBeginImageContext(CGSize(width: width, height: height))
            draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage!
        } else if self.size.width < self.size.height && self.size.height > maxBorder {
            height = maxBorder
            width = height / self.size.height * self.size.width
            
            UIGraphicsBeginImageContext(CGSize(width: width, height: height))
            draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage!
        } else {
            return self
        }
    }
}
