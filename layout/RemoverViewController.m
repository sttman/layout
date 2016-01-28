//
//  testViewController.m
//  test10.19
//
//  Created by readchen on 15/10/19.
//  Copyright © 2015年 readchen. All rights reserved.
//

#import "RemoverViewController.h"

@interface RemoverViewController ()
{
    __weak UIView * _greenView;
}
@end

@implementation RemoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    _greenView = greenView;
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor  = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.2);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
    }];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redView.mas_right).offset(20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.2);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
    }];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(greenView.mas_right).offset(20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.2);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
        make.left.equalTo(redView.mas_right).offset(20).priority(250);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_greenView removeFromSuperview];
    [UIView animateWithDuration:1.0f animations:^{
        // 不写这行没有动画效果
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
