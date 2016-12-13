//
//  validation1.swift
//  ResearchMemoryAlign
//
//  Created by mothule on 2016/12/08.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation

// 検証内容
// データバスが8バイトならアライメント4の8バイト構造体とアライメント8の8バイト構造体は理論上は同速になるが、結果はどちらが早いか？

func profileAlignment4vs8Structure()
{
    for _ in 1..<5 {
        profileAlignment8Structure()
        profileAlignment4Structure()
    }
}

private func profileAlignment8Structure()
{
    startTime();
    
    var list:[Alignment8Structure] = []
    for _ in 1..<10 {
        for _ in 1..<10000 {
            list.append(Alignment8Structure(integer0: 1))
        }
        list.removeAll(keepingCapacity:false)
    }
    
    stopTime();
    print(String(format: "%llu", getElapsed()))
}

private func profileAlignment4Structure()
{
    startTime();
    
    var list:[Alignment4Structure] = []
    for _ in 1..<10 {
        for _ in 1..<10000 {
            list.append(Alignment4Structure(integer0: 1, integer1: 2))
        }
        list.removeAll(keepingCapacity: false)
    }
    
    stopTime();
    print(String(format: "%llu", getElapsed()))
}
