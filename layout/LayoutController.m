//
//  LayoutController.m
//  layout
//
//  Created by shitaotao on 16/1/26.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "LayoutController.h"

@implementation LayoutController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 初始化
    UIView * view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    
    
    UIView * view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    
    
    UIView * view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor redColor];
    [self.view addSubview:view3];
    
    
    UIView * view4 = [[UIView alloc]init];
    view4.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view4];
    
    // 布局
    __weak typeof(self) mySelf = self;
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100,100));
        make.centerX.equalTo(mySelf.view);
        make.top.mas_equalTo(10);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.mas_equalTo(mySelf.view);
    }];
    
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.mas_equalTo(mySelf.view).with.offset(10);
        make.bottom.mas_equalTo(mySelf.view).with.offset(-10);
    }];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(mySelf.view).multipliedBy(0.5);
        make.centerX.equalTo(mySelf.view);
        make.bottom.equalTo(mySelf.view).with.offset(10);
    }];
    
    // 不可以运行，理解使用
    
    /*
     // 初始化
     UIView *redView = [[UIView alloc]init];
     redView.backgroundColor = [UIColor redColor];
     [self.view addSubview:redView];
     
     UIView *blueView = [[UIView alloc]init];
     blueView.backgroundColor = [UIColor blueColor];
     [self.view addSubview:blueView];
     
     UIView *yellow = [[UIView alloc]init];
     yellow.backgroundColor = [UIColor yellowColor];
     [self.view addSubview:yellow];
     
     UIView *green = [[UIView alloc]init];
     green.backgroundColor = [UIColor greenColor];
     [self.view addSubview:green];
     
     // 布局
     [redView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.equalTo(self.view.mas_left).offset(0);//使左边等于self.view的左边，间距为0
     make.top.equalTo(self.view.mas_top).offset(0);//使顶部与self.view的间距为0
     make.width.equalTo(self.view.mas_width).multipliedBy(0.5);//设置宽度为self.view的一半，multipliedBy是倍数的意思，也就是，使宽度等于self.view宽度的0.5倍
     make.height.equalTo(self.view.mas_height).multipliedBy(0.5);//设置高度为self.view高度的一半
     
     }];
     
     [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.width.and.height.equalTo(redView);//使宽高等于redView
     make.top.equalTo(redView.mas_top);//与redView顶部对齐
     make.leading.equalTo(redView.mas_right);//与redView的间距为0
     }];
     
     [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
     make.leading.equalTo(redView);//与redView左对齐
     make.top.equalTo(redView.mas_bottom);//与redView底部间距为0
     make.width.and.height.equalTo(redView);//与redView宽高相等
     }];
     
     [green mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.equalTo(yellow.mas_right);//与yellow右边间距为0
     make.top.equalTo(blueView.mas_bottom);//与blueView底部间距为0
     make.width.and.height.equalTo(redView);//与redView等宽高
     }];
     */
}

@end
