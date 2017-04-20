//
//  LXButton.m
//  LXProgrammeModel_Demo
//
//  Created by linxiang on 2017/4/20.
//  Copyright © 2017年 minxing. All rights reserved.
//

#import "LXButton.h"

@implementation LXButton

- (LXButtonStringBlock)imageName{
    return ^LXButton *(NSString *aName){
        [self setImage:[UIImage imageNamed:aName] forState:UIControlStateNormal];
        NSLog(@"imageName");
        return self;
    };
}

- (LXButtonStringBlock)title{
    return ^LXButton *(NSString *aName){
        [self setTitle:aName forState:UIControlStateNormal];
        NSLog(@"title");
        return self;
    };
}

- (LXButtonIntegerBlock)titleFont{
    return ^LXButton *(NSUInteger aNumber){
        self.titleLabel.font = [UIFont systemFontOfSize:aNumber];
        NSLog(@"titleFont");
        return self;
    };
}

- (LXButtonColorBlock)textColor{
    return ^LXButton *(UIColor *aColor){
        [self setTitleColor:aColor forState:UIControlStateNormal];
        NSLog(@"textColor = %@",aColor);
        return self;
    };
}

- (LXButtonFrameBlock)btnframe{
    return ^LXButton *(CGRect btnframe){
        [self setFrame:btnframe];
        return self;
    };
}

+ (LXButton *)makeJJButton:(void (^)(LXButton *))block{
    LXButton * button = [[LXButton alloc] init];
    block(button);
    return button;
}
@end
