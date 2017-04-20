//
//  NSObject+CaculatorMaker.h
//  LXProgrammeModel_Demo
//
//  Created by linxiang on 2017/4/17.
//  Copyright © 2017年 minxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CaculatorMaker;

@interface NSObject (CaculatorMaker)

//计算
+ (int)makeCaculators:(void(^)(CaculatorMaker *make))block;

@end
