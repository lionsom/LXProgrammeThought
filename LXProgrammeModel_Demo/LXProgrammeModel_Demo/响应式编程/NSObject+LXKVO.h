//
//  NSObject+LXKVO.h
//  LXProgrammeModel_Demo
//
//  Created by linxiang on 2017/4/20.
//  Copyright © 2017年 minxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LXKVO)

- (void)LX_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
