//
//  AnimatedViewController.m
//  layout
//
//  Created by shitaotao on 16/1/29.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "AnimatedViewController.h"

@interface AnimatedViewController ()
@property (nonatomic, strong) NSMutableArray * viewArray;  // 装的是所有的view
@end

@implementation AnimatedViewController

- (NSMutableArray *)viewArray{
    if (_viewArray == nil) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * lastView = self.view; // 获取最底层的view
    for (int i = 0; i < 6; i++) {  // 创建视图
        UIView * view = [[UIView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1];
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 3;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) { // 做约束
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20)); // 比上一个View缩小边距20
        }];
        lastView = view;
        [self.viewArray addObject:view];
        // 添加手势到每一个视图上
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taping)];
        [view addGestureRecognizer:tap];
    }
}

- (void)taping{
    UIView * lastView = self.view;
    NSMutableArray * Reset = [NSMutableArray arrayWithCapacity:0]; // 重新排序
    for (NSInteger i = self.viewArray.count - 1; i >= 0; i--) {
        UIView * itemView = [self.viewArray objectAtIndex:i];
        [itemView mas_remakeConstraints:^(MASConstraintMaker *make) { // 删除所有的view约束从新添加约束
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
        [self.view bringSubviewToFront:itemView];
        lastView = itemView;
        [Reset addObject:itemView];
    }
    self.viewArray = Reset;
    
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{  // 动画效果
        [self.view layoutIfNeeded];
    }];
}

@end
