//
//  LayoutController.m
//  layout
//
//  Created by shitaotao on 16/1/26.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "BasicController.h"

@implementation BasicController

- (void)viewDidLoad{
    [super viewDidLoad];
    
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
    __weak typeof(self) myself = self;
    
    // 布局
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(myself.view.mas_left).offset(0); //使左边等于self.view的左边，间距为0
        make.top.equalTo(myself.view.mas_top).offset(0); //使顶部与self.view的间距为0
        make.width.equalTo(myself.view.mas_width).multipliedBy(0.5); //设置宽度为self.view的一半，multipliedBy是倍数的意思，也就是，使宽度等于self.view宽度的0.5倍
        make.height.equalTo(myself.view.mas_height).multipliedBy(0.5); //设置高度为self.view高度的一半
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView); //使宽高等于redView
        make.top.equalTo(redView.mas_top); //与redView顶部对齐
        make.left.equalTo(redView.mas_right); //与redView的间距为0
    }];
    
    [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(redView); //与redView左对齐
        make.top.equalTo(redView.mas_bottom); //与redView底部间距为0
        make.width.and.height.equalTo(redView); //与redView宽高相等
    }];
    
    [green mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(yellow.mas_right); //与yellow右边间距为0
        make.top.equalTo(blueView.mas_bottom); //与blueView底部间距为0
        make.width.and.height.equalTo(redView); //与redView等宽高
    }];
}

@end
