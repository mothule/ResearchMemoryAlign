//
//  EzStopWatch.m
//  ResearchMemoryAlign
//
//  Created by mothule on 2016/12/08.
//  Copyright © 2016年 mothule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EzStopWatch.h"

uint64_t start, end, elapsed;

void startTime(){
    start = mach_absolute_time();
}

uint64_t getElapsed(){
    return elapsed;
}

uint64_t stopTime(){
    end = mach_absolute_time();
    mach_timebase_info_t base;
    mach_timebase_info(base);
    elapsed = (end - start) / base->denom;
    return getElapsed();
}
