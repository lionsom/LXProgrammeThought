//
//  ViewController.m
//  LXProgrammeModel_Demo
//
//  Created by linxiang on 2017/4/17.
//  Copyright © 2017年 minxing. All rights reserved.
//

#import "ViewController.h"

#import "CaculatorMaker.h"

#import "NSObject+CaculatorMaker.h"

#import "LXButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


/**
 链式编程 计算器
 */
- (IBAction)LianshiCallBack:(id)sender {
    
    int iResult = [NSObject makeCaculators:^(CaculatorMaker *make) {
        make.add(1).add(2).add(3).divide(2);
    }];
    
    NSLog(@"Result == %d",iResult);
    
}

- (IBAction)LianShiCallBack_UIButton:(id)sender {
    
    [LXButton makeJJButton:^(LXButton *button) {
        button.title(@"xixixi").imageName(@"abc").titleFont(20).textColor([UIColor orangeColor]).btnframe(CGRectMake(100, 100, 100, 100));
        button.frame = CGRectMake(100, 250, 100, 100);
        [self.view addSubview:button];
        [button addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
