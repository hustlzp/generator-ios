//
//  MBProgressHUD+Helper.swift
//  SpringFestival
//
//  Created by 刘志鹏 on 2017/1/16.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//

import Foundation
import MBProgressHUD
import ionicons

extension MBProgressHUD {
    func hideForSuccess(text: String? = nil, completion: (() -> Void)? = nil) {
        hideForSuccess(delay: 0.5, text: text, completion: completion)
    }
    
    func hideForSuccess(delay: Double, text: String? = nil, completion: (() -> Void)? = nil) {
        label.text = text
        mode = .customView
        customView = UIImageView(image: IonIcons.image(withIcon: ion_checkmark, size: 37, color: UIColor.white))
        Utils.dispatchAfter(delay) { () -> Void in
            self.hide(animated: true)
            completion?()
        }
    }
    
    func hideForError(text: String?, completion: (() -> Void)? = nil) {
        hideForError(delay: 0.5, text: text, completion: completion)
    }
    
    func hideForError(delay: Double, text: String?, completion: (() -> Void)? = nil) {
        label.text = text
        mode = .customView
        customView = UIImageView(image: IonIcons.image(withIcon: ion_close, size: 37, color: UIColor.white))
        Utils.dispatchAfter(delay) { () -> Void in
            self.hide(animated: true)
            completion?()
        }
    }
    
    func hideForInfo(delay: Double, text: String?, completion: (() -> Void)? = nil) {
        label.text = text
        mode = .text
        Utils.dispatchAfter(delay) { () -> Void in
            self.hide(animated: true)
            completion?()
        }
    }
    
    class func showForSuccess(view: UIView, text: String? = nil, delay: Double = 1,  completion: (() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        
        hud.label.text = text
        hud.mode = .customView
        hud.customView = UIImageView(image: IonIcons.image(withIcon: ion_checkmark, size: 37, color: UIColor.white))
        
        Utils.dispatchAfter(delay) { () -> Void in
            hud.hide(animated: true)
            completion?()
        }
    }
    
    class func showForInfo(view: UIView, text: String? = nil, delay: Double = 1,  completion: (() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        
        hud.label.text = text
        hud.mode = .text
        
        Utils.dispatchAfter(delay) { () -> Void in
            hud.hide(animated: true)
            completion?()
        }
    }
    
    class func showForError(view: UIView, text: String? = nil, delay: Double = 1, completion: (() -> Void)? = nil) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        
        hud.label.text = text
        hud.mode = .text
        
        Utils.dispatchAfter(delay) { () -> Void in
            hud.hide(animated: true)
            completion?()
        }
    }
}
