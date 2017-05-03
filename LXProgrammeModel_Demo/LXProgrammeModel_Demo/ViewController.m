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

#import "Person.h"

#import "NSObject+LXKVO.h"

@interface ViewController ()

@property(nonatomic, strong) Person * per;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self KVO_addObserver];
    
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

/**
 链式编程 创建Button
 */
- (IBAction)LianShiCallBack_UIButton:(id)sender {
    
    [LXButton makeJJButton:^(LXButton *button) {
        button.title(@"xixixi").imageName(@"abc").titleFont(20).textColor([UIColor orangeColor]).btnframe(CGRectMake(100, 100, 100, 100));
        button.frame = CGRectMake(100, 250, 100, 100);
        [self.view addSubview:button];
//        [button addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
}



#pragma mark -- KVO

- (void)KVO_addObserver {
    Person * p = [[Person alloc]init];
    _per = p;
    
    // 1、监听属性
    [_per addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [_per addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    //KVO底层实现
    //1.自定义Person类的子类!
    //2.重写setName:方法,在内部恢复父类做法,通知观察者
    //3.如何让外界调用自定义Person的子类方法,修改当前对象的isa指针,指向自定义的子类!
}

// 2、一旦 监听的对象属性变化了，就走这个回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"AAA ==%@ ==%@ == %@",keyPath, object, change);
}

/**
 响应式编程-KVO实现
 */
- (IBAction)KVOCallBack:(id)sender {
    _per.name = @"aa";
    _per.age = 22;
}


#pragma mark -- 自定义KVO
// 添加监听
- (void)Self_KVO_addObserver {
    Person * p = [[Person alloc]init];
    _per = p;
    
    [_per LX_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [_per LX_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)LX_observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    NSLog(@"LX_BBB ==%@ ==%@ == %@",keyPath, object, change);
}

/**
 响应式编程 自定义KVO
 */
- (IBAction)Self_KVOCallBack:(id)sender {
    
    _per.name = @"self define";
    _per.age = 15;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
