//
//  AVObject+Helper.swift
//  SpringFestival
//
//  Created by 刘志鹏 on 2017/1/16.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//

import Foundation
import AVOSCloud

extension Array where Element: AVObject {
    /**
     合并最新数据到首部
     注：合并之前，删除self中已存在于新数据中的objects
     
     - parameter objects: <#objects description#>
     */
    mutating func mergeNewData(_ newObjects: [Element])  {
        let existObjectIds = newObjects.map { $0.objectId! }
        let filteredObjects = filter { !existObjectIds.contains($0.objectId!) }
        
        removeAll()
        append(contentsOf: newObjects + filteredObjects)
    }
    
    /**
     合并历史数据到尾部
     注：合并之前，删除历史数据中已经存在于self中的objects
     
     - parameter objects: <#objects description#>
     */
    mutating func mergeHistoryData(_ historyObjects: [Element]) {
        let existObjectIds = map { $0.objectId! }
        let filteredHistoryObjects = historyObjects.filter { !existObjectIds.contains($0.objectId!) }
        
        append(contentsOf: filteredHistoryObjects)
    }
}
