//
//  validation2.swift
//  ResearchMemoryAlign
//
//  Created by mothule on 2016/12/08.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation


// 検証内容
// 暗黙のパディングが入ることで4バイトアライメントされているなら、
// 1バイト1個4バイト1個の構造体と4バイト2個の構造体は、理論上同速になるが、結果はどうなのか？

func profileAutoPadding()
{
    // warming up
    let _ = profileNonAlignedStructureTypeB()
    let _ = profileAlignedStructureTypeA()
    
    let count:UInt64 = 5
    
    var avgA:UInt64 = 0
    var avgB:UInt64 = 0
    for _ in 0..<count {
        let time = profileNonAlignedStructureTypeB()
        print(String(format: "A:%llu", time))
        avgA += time
    }
    for _ in 0..<count {
        let time = profileAlignedStructureTypeA()
        print(String(format: "B:%llu", time))
        avgB += time
    }
    
    print(String(format: "avgA:%llu", avgA/count))
    print(String(format: "avgB:%llu", avgB/count))
}
private func profileNonAlignedStructureTypeB() -> UInt64{
    startTime();
    
    var list:[NonAlignedStructureTypeB] = []
    for _ in 1..<10 {
        for _ in 1..<10000 {
            list.append(NonAlignedStructureTypeB(integer0: 170, integer1: UINT32_MAX ))
        }
        list.removeAll(keepingCapacity:false)
    }
    
    stopTime();
    return getElapsed()
}
private func profileAlignedStructureTypeA() -> UInt64{
    startTime();
    
    var list:[AlignedStructureTypeA] = []
    for _ in 1..<10 {
        for _ in 1..<10000 {
            list.append(AlignedStructureTypeA(integer0: UINT32_MAX, integer1: UINT32_MAX) )
        }
        list.removeAll(keepingCapacity:false)
    }
    
    stopTime();
    return getElapsed()
}
