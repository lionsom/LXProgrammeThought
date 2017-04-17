//
//  CaculatorMaker.m
//  LXProgrammeModel_Demo
//
//  Created by linxiang on 2017/4/17.
//  Copyright © 2017年 minxing. All rights reserved.
//

#import "CaculatorMaker.h"

@implementation CaculatorMaker

- (CaculatorMaker *(^)(int))add
{
    return ^(int value)
    {
        _iResult += value;
        return self;
    };
}

//减法
- (CaculatorMaker *(^)(int))sub
{
    return ^(int value)
    {
        _iResult -= value;
        return self;
    };
}

//乘法
- (CaculatorMaker *(^)(int))muilt
{
    return ^(int value)
    {
        _iResult *= value;
        return self;
    };
}

//除法
- (CaculatorMaker *(^)(int))divide
{
    return ^(int value)
    {
        _iResult /= value;
        return self;
    };
}


@end
