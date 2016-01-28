//
//  testViewController.m
//  test10.19
//
//  Created by readchen on 15/10/19.
//  Copyright © 2015年 readchen. All rights reserved.
//

#import "RemoverViewController.h"

@interface RemoverViewController (){
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
        make.left.equalTo(self.view.mas_left).offset(20); // 左边离self.view的左边20
        make.bottom.equalTo(self.view.mas_bottom).offset(-20); // 下面离self.view的下面20，你知道坐标系就明白为什么要加上负号
        make.width.equalTo(self.view.mas_width).multipliedBy(0.2); // width等于self.view.width的一半
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2); // height等于self.view.height的一半
    }];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {  // 同上
        make.left.equalTo(redView.mas_right).offset(20);  // 这里是redView的右边登入greenView的左边
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.2);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
    }];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) { // 同上
        make.left.equalTo(greenView.mas_right).offset(20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.2);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
        make.left.equalTo(redView.mas_right).offset(20).priority(250);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_greenView removeFromSuperview];
    [UIView animateWithDuration:1.0f animations:^{ // 不写这个没有动画效果
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
