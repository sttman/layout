//
//  testViewController.m
//  test10.19
//
//  Created by readchen on 15/10/19.
//  Copyright © 2015年 readchen. All rights reserved.
//

#import "TestViewController.h"
#import <Masonry.h>
@interface TestViewController ()
{
    __weak UIView * _greenView;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     //    UIView *orange =[[UIView alloc] init];
     //    orange.backgroundColor =[UIColor orangeColor];
     //    [self.view addSubview:orange];
     //    [orange mas_makeConstraints:^(MASConstraintMaker *make) {
     //        make.center.equalTo(self.view);
     //        make.size.mas_equalTo(CGSizeMake(200, 200));
     //    }];
     self.view.backgroundColor = [UIColor whiteColor];
     // 和并下多个视图相隔相同的方法
     __weak __typeof(self) weakSelf = self;
     UIView * tempView = [[UIView alloc]init];
     NSInteger count = 6;//设置一排view的个数
     NSInteger margin = 10;//设置相隔距离
     NSInteger height = 50;//设置view的高度
     for (int i = 0; i < count; i ++) {
     UIView * view = [[UIView alloc]init];
     view.backgroundColor = [UIColor brownColor];
     [self.view addSubview:view];
     if (i == 0) {
     [view mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.equalTo(weakSelf.view).offset(margin);//x
     make.centerY.equalTo(weakSelf.view);// y w
     make.height.mas_equalTo(height); // h
     }];
     }
     else if (i == count - 1){
     [view mas_makeConstraints:^(MASConstraintMaker *make) {
     make.right.equalTo(weakSelf.view).offset(-margin);
     make.left.equalTo(tempView.mas_right).offset(margin); // x
     make.centerY.equalTo(tempView); // y
     make.height.equalTo(tempView); // h
     make.width.equalTo(tempView); // w
     }];
     }
     else{
     [view mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.equalTo(tempView.mas_right).offset(margin); // x
     make.centerY.equalTo(tempView);  // y
     make.height.equalTo(tempView); // h
     make.width.equalTo(tempView); // w
     }];
     }
     tempView = view;
     [view layoutIfNeeded];
     }
     */
    
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
