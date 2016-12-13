//
//  Benchmark.swift
//  ResearchMemoryAlign
//
//  Created by mothule on 2016/12/12.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation

class Benchmark {
    typealias Block = (() -> Void)
    private static let SAMPLING_COUNT = 10

    class func measure(of block:Block, blockName:String) {
        
        var times:[TimeInterval] = []
        for _ in 0..<SAMPLING_COUNT {
            let startTime = CFAbsoluteTimeGetCurrent()
            block()
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            times.append(timeElapsed)
        }
        
        let avgTime = times.reduce(0, +) / CFAbsoluteTime(times.count)
        let minTime = times.min()!
        let maxTime = times.max()!
        
        print(String(format:"%@ Avg:%fsec Min:%fsec Max:%fsec", blockName, avgTime, minTime, maxTime))
    }

}
