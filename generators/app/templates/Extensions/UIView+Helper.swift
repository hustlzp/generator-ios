//
//  UIView.swift
//  luoying
//
//  Created by 刘志鹏 on 2017/1/8.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    func calSize(atWidth width: CGFloat = Size.screenWidth) -> CGSize {
        frame = CGRect(x: 0, y: 0, width: width, height: 0)
        
        setNeedsLayout()
        layoutIfNeeded()
        
        return systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    }
    
    func resetFrame(width: CGFloat? = nil) {
        if width != nil {
            frame = CGRect(x: 0, y: 0, width: width!, height: 0)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        
        frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    class func createHorizonalBorderView(color: UIColor = Color.borderColor) -> UIView {
        let border = UIView()
        
        border.backgroundColor = color
        
        border.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(1 / UIScreen.main.scale)
        }
        
        return border
    }
    
    class func createVerticalBorderView(color: UIColor = Color.borderColor) -> UIView {
        let border = UIView()
        
        border.backgroundColor = color
        
        border.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(1 / UIScreen.main.scale)
        }
        
        return border
    }
    
    func addTopBorder(color: UIColor = Color.borderColor) {
        let topBorder = UIView.createHorizonalBorderView(color: color)
        
        addSubview(topBorder)
        
        topBorder.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self)
        }
    }
    
    func addBottomBorder(color: UIColor = Color.borderColor) {
        let bottomBorder = UIView.createHorizonalBorderView(color: color)
        
        addSubview(bottomBorder)
        
        bottomBorder.snp.makeConstraints { (make) -> Void in
            make.bottom.left.right.equalTo(self)
        }
    }
    
    func addRightBorder(color: UIColor = Color.borderColor) {
        let border = UIView.createVerticalBorderView(color: color)
        
        addSubview(border)
        
        border.snp.makeConstraints { (make) -> Void in
            make.top.bottom.right.equalTo(self)
        }
    }
    
    class func createTitleView(_ title: String?) -> UILabel {
        let label = UILabel()

        label.text = title
        label.font = UIFont(name: "w", size: 55)
        
        return label
    }
    
    class func createSubtitleView(_ subtitle: String?) -> UILabel {
        let label = UILabel()

        label.textColor = Color.mainColor
        label.text = subtitle
        label.font = UIFont(name: "w", size: 25)
        
        return label
    }
    
    class func createParaLabel(_ text: String, width: CGFloat) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.setText(width: width, text: text, lineSpacing: 10, paragraphSpacing: 10)
        
        return label
    }
    
    class func createIconLabel(code: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        
        label.text = code
        label.textColor = Color.mainColor
        label.font = UIFont(name: "iconfont", size: size)
        
        return label
    }
    
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
