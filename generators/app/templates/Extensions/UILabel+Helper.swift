//
//  UILabel.swift
//  SpringFestival
//
//  Created by 刘志鹏 on 2017/1/23.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//

import Foundation

extension UILabel {
    func setText(width: CGFloat, text: String, lineSpacing: CGFloat = 0, paragraphSpacing: CGFloat = 0) {
        var lineCount = 0;
        let textSize = CGSize(width: width, height: CGFloat(Float.infinity))
        let rHeight = (text as NSString).boundingRect(with: textSize, options: [.usesLineFragmentOrigin], attributes: [NSFontAttributeName: self.font], context: nil).height
        let charSize = lroundf(Float(self.font.lineHeight));
        lineCount = lroundf(Float(rHeight)) / charSize
        
        if lineCount == 1 {
            self.attributedText = NSAttributedString(string: text)
        } else {
            let paraStyle = NSMutableParagraphStyle()
            
            paraStyle.lineSpacing = lineSpacing
            paraStyle.paragraphSpacing = paragraphSpacing
            paraStyle.lineBreakMode = self.lineBreakMode
            paraStyle.alignment = self.textAlignment
            
            self.attributedText = NSAttributedString(string: text, attributes: [NSParagraphStyleAttributeName: paraStyle])
        }
    }
}
