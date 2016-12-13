//
//  MemoryLayoutInfo.swift
//  ResearchMemoryAlign
//
//  Created by mothule on 2016/12/10.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation

struct MemoryLayoutInfo<T>
{
    var className:String
    var size:Int
    var stride:Int
    var alignment:Int
    
    init(){
        className = String(describing: type(of:T.self))
        size = MemoryLayout<T>.size
        stride = MemoryLayout<T>.stride
        alignment = MemoryLayout<T>.alignment
    }
}

extension MemoryLayoutInfo : CustomStringConvertible
{
    var description:String {
        return "size:\(size) Bytes stride:\(stride) alignment:\(alignment) \(className)"
    }
    func print(){
        Swift.print(self)
    }
}
