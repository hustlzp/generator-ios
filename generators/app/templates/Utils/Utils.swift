//
//  Utils.swift
//  SpringFestival
//
//  Created by 刘志鹏 on 2017/1/16.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//

import UIKit
import Photos
import MJRefresh

class Utils: NSObject {
    // MARK: GCD
    
    class func dispatchAfter(_ second: Double, completion: @escaping () -> Void) {
        let when = DispatchTime.now() + second
        
        DispatchQueue.main.asyncAfter(deadline: when) {
            completion()
        }
    }
    
    // MARK: Permissions
    
    class func checkCameraAuthDenied() -> Bool {
        return AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) == .denied
    }
    
    class func checkAlbumAuthDenied() -> Bool {
        return PHPhotoLibrary.authorizationStatus() == .denied
    }
    
    class func checkMicrophoneAuthDenied() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission() == .denied
    }
    
    class func checkRegisteredForRemoteNotifications() -> Bool {
        return UIApplication.shared.isRegisteredForRemoteNotifications
    }
    
    class func openSettingsViewController() {
        UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
    }
    
    // MARK: Show permission request alert
    
    class func showPermissionReuqestAlert(controller: UIViewController, title: String) {
        let alertController = UIAlertController(title: nil, message: title, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "去设置", style: .default, handler: { (action) in
            UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
        }))
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
    class func showAlbumPermissionReuqestAlert(controller: UIViewController) {
        showPermissionReuqestAlert(controller: controller, title: "请允许枫叶书签访问您的照片")
    }
    
    class func showCameraPermissionReuqestAlert(controller: UIViewController) {
        showPermissionReuqestAlert(controller: controller, title: "请允许枫叶书签使用您的相机")
    }
    
    class func showMicrophonePermissionRequestAlert(controller: UIViewController) {
        showPermissionReuqestAlert(controller: controller, title: "请允许枫叶书签使用您的麦克风")
    }
    
    // MARK: MJRefresh
    
    class func createMJRefreshHeader(refreshingBlock: MJRefreshComponentRefreshingBlock!) -> MJRefreshNormalHeader {
        let header = MJRefreshNormalHeader(refreshingBlock: refreshingBlock)!
        
        header.lastUpdatedTimeLabel?.isHidden = true
        header.setTitle("下拉刷新", for: .idle)
        header.setTitle("松开刷新", for: .pulling)
        header.setTitle("正在刷新", for: .refreshing)
        
        return header
    }
    
    class func createMJRefreshFooter(refreshingBlock: MJRefreshComponentRefreshingBlock!) -> MJRefreshAutoNormalFooter {
        let footer = MJRefreshAutoNormalFooter(refreshingBlock: refreshingBlock)!
        
        footer.setTitle("", for: .noMoreData)
        footer.isHidden = true
        
        return footer
    }
    
}
