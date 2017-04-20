//
//  LXButton.h
//  LXProgrammeModel_Demo
//
//  Created by linxiang on 2017/4/20.
//  Copyright © 2017年 minxing. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LXButton;

//typedef一个返回值为LXButton* 参数为NSString* 的名字为LXButtonStringBlock的block,方便以后快速定义该类型block
typedef LXButton *(^LXButtonStringBlock)(NSString *aName);
typedef LXButton *(^LXButtonIntegerBlock)(NSUInteger aNumber);
typedef LXButton *(^LXButtonColorBlock)(UIColor *aColor);
typedef LXButton *(^LXButtonFrameBlock)(CGRect aFrame);


@interface LXButton : UIButton


- (LXButtonStringBlock)imageName;

- (LXButtonStringBlock)title;

- (LXButtonIntegerBlock)titleFont;

- (LXButtonColorBlock)textColor;

- (LXButtonFrameBlock)btnframe;


//该方法为工厂方法,能够快速创建一个ChainButton,在一个参数为block的方法中一次性设置好你需要的ChainButton
+ (LXButton *)makeJJButton:(void (^)(LXButton *))block;

@end
