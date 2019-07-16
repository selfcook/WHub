//
//  FileHandle.swift
//  WHub
//
//  Created by wtoe on 2019/3/25.
//  Copyright © 2019年 shihao. All rights reserved.
//  处理本地文件

import Foundation

internal func printFM(_ str: String) {
#if DEBUG
    print("FileHandle: \(str)")
#endif
}


public enum FileTpye {
    case dir, moive, others
}


public class FileModel: NSObject {
    
    public var fileName : String?
    
    public var fileSize : String?
    
    public var fileType : FileTpye?
    
}


class FileHandle: NSObject {
    
    //单例
    static let `default` = FileHandle()
    
    //沙盒路径
    let path = NSHomeDirectory() + "/Documents"
    let fm = FileManager.default
    
    //本地文件数据模型集合
//    var fileModelArr = [FileModel]() {
//        didSet{
//            print("文件数组发生变化了")
//        }
//    }
    
    
    public func getFileArr() -> Array<FileModel>? {
        
        var docArr = try? fm.contentsOfDirectory(atPath: path)
        docArr = docArr?.filter{$0 != ".DS_Store"}
        
        var fileModelArr : [FileModel] = []
        let subPathArr = getSubPathArr(path: path)
        
        
        for item in docArr! {
            let model = FileModel()
            let isDir = directoryIsExists(path: path + "/" + item)
            
            model.fileType = isDir ? FileTpye.dir : FileTpye.others
            model.fileName = item
            model.fileSize = getFileSize(name: item)
            
            fileModelArr.append(model)
            
        }
        
        
        print(subPathArr as Any)
        printFM(path)
        printFM("filenamelist: \(fileModelArr)")
        
        return fileModelArr
    }
    
    
    func getSubPathArr(path:String) -> [String]? {
        let arr = try? fm.subpathsOfDirectory(atPath: path)
        
        return arr
    }
    
    
    func getFileSize(name:String) -> String? {
        let filePath = path + "/" + name
        var size: Any?
        do {
            size = try fm.attributesOfItem(atPath: filePath)[FileAttributeKey.size]
        } catch (let error) {
            printFM("File size error: \(error)")
            return nil
        }
        
        guard let fileSize = size as? UInt64 else {
            return nil
        }
        
        // bytes
        if fileSize < 1023 {
            return String(format: "%lu bytes", CUnsignedLong(fileSize))
        }
        // KB
        var floatSize = Float(fileSize / 1024)
        if floatSize < 1023 {
            return String(format: "%.1f KB", floatSize)
        }
        // MB
        floatSize = floatSize / 1024
        if floatSize < 1023 {
            return String(format: "%.1f MB", floatSize)
        }
        // GB
        floatSize = floatSize / 1024
        return String(format: "%.1f GB", floatSize)
        
    }

    // 判断是否是文件夹的方法
    
    func directoryIsExists (path: String) -> Bool {
        
        var directoryExists = ObjCBool.init(false)
        
        let fileExists = FileManager.default.fileExists(atPath: path, isDirectory: &directoryExists)
        
        
        return fileExists && directoryExists.boolValue
        
    }
}
