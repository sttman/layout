//
//  ModifyViewController.m
//  layout
//
//  Created by shitaotao on 16/1/28.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "ModifyViewController.h"

@interface ModifyViewController ()

@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, strong) MASConstraint *height;

@end

@implementation ModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化一个按钮
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
    // 描边
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    // 切角
    self.growingButton.layer.cornerRadius = 20;
    self.growingButton.clipsToBounds = YES;
    
    self.growingButton.backgroundColor = [UIColor redColor];
    [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingButton];
    self.isExpanded = NO;
    // 调用这个方法才会有界面
    [self updateViewConstraints];
}
/**
 *  界面更新时调用这个方法，要手动调用，注意要用父类方法
 */
- (void)updateViewConstraints {
    // 这里使用update也是一样的。
    // remake会将之前的全部移除，然后重新添加
    __weak typeof(self) weakSelf = self;
    [self.growingButton mas_remakeConstraints:^(MASConstraintMaker *make) { // 更新视图约束
        make.top.mas_equalTo(0); // 上面离顶部为0 这样写默认是与self.view进行比较
        make.left.right.mas_equalTo(0); // 左右都是0
        if (weakSelf.isExpanded) {  // 判断下面离self.view的距离，进行变换
            make.bottom.mas_equalTo(0);
        } else {
            make.bottom.mas_equalTo(-350);
        }
    }];
    [super updateViewConstraints];  // 一定要调用父类方法
}

- (void)onGrowButtonTaped:(UIButton *)sender {
    self.isExpanded = !self.isExpanded;
    if (!self.isExpanded) {
        [self.growingButton setTitle:@"点我展开" forState:UIControlStateNormal];
    } else {
        [self.growingButton setTitle:@"点我收起" forState:UIControlStateNormal];
    }
    
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{ // 添加这段代码是为了添加一个动画效果。
        [self.view layoutIfNeeded];
    }];
}

@end
