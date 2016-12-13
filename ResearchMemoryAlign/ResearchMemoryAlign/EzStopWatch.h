//
//  EzStopWatch.h
//  ResearchMemoryAlign
//
//  Created by mothule on 2016/12/08.
//  Copyright © 2016年 mothule. All rights reserved.
//

#ifndef Profile_h
#define Profile_h
#import <mach/mach_time.h>


void startTime();
uint64_t stopTime();
uint64_t getElapsed();

#endif /* Profile_h */
