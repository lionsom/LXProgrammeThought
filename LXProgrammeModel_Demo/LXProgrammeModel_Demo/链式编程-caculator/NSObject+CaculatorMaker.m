//
//  NSObject+CaculatorMaker.m
//  LXProgrammeModel_Demo
//
//  Created by linxiang on 2017/4/17.
//  Copyright © 2017年 minxing. All rights reserved.
//

#import "NSObject+CaculatorMaker.h"

#import "CaculatorMaker.h"

@implementation NSObject (CaculatorMaker)

//计算
+ (int)makeCaculators:(void(^)(CaculatorMaker *make))block
{
    CaculatorMaker *mgr = [[CaculatorMaker alloc] init];
    block(mgr);
    return mgr.iResult;
}

@end

