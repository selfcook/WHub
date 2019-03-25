//
//  FileHandle.swift
//  WHub
//
//  Created by wtoe on 2019/3/25.
//  Copyright © 2019年 shihao. All rights reserved.
//  处理本地文件

import Foundation

class FileHandle: NSObject {
    
    //单例
    static let `default` = FileHandle()
    
    
    func getFileArr() -> Array<Any> {
        let home = NSHomeDirectory()
        let fm = FileManager.default
        let docArr = try? fm.contentsOfDirectory(atPath: home + "/Documents")
        
        print("file: \(docArr!)")
        return docArr!
    }

    
}
