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
    // 可以运行
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
    // 不可以运行,理解使用
    /*
     // 初始化
     UIView * gray1 = [[UIView alloc]init];
     gray1.backgroundColor = [UIColor grayColor];
     [self.view addSubview:gray1];
     
     UIView * red1 = [[UIView alloc]init];
     red1.backgroundColor = [UIColor redColor];
     [self.view addSubview:red1];
     
     UIView * red2 = [[UIView alloc]init];
     red2.backgroundColor = [UIColor redColor];
     [self.view addSubview:red2];
     
     UIView * gray2 = [[UIView alloc]init];
     gray2.backgroundColor = [UIColor grayColor];
     [self.view addSubview:gray2];
     
     UIView * gray3 = [[UIView alloc]init];
     gray3.backgroundColor = [UIColor grayColor];
     [self.view addSubview:gray3];
     
     //代码中View的顺序与图中从左到右的View的顺序一致
     //例子中，唯一不确定的就是灰色View的宽度，我们先把确定的约束给一个一个的添加上来
     
     //灰1左间距、高度、垂直位置（因为和红1底部对齐）是确定的，添加约束
     [gray1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.height.mas_equalTo(20);
     make.leading.equalTo(self.view.mas_leading).offset(0);
     make.bottom.equalTo(red1.mas_bottom);
     }];
     
     //红1，宽高、左间距、底间距是确定的，添加约束
     [red1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.width.mas_equalTo(100);
     make.height.mas_equalTo(50);
     make.left.equalTo(gray1.mas_right);
     make.bottom.equalTo(self.view.mas_bottom).offset(-50);
     }];
     //灰2，左间距、高度、垂直位置是确定的，宽度要与灰1一致，是为了能均匀填充，添加约束
     [gray2 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.height.and.width.equalTo(gray1);
     make.leading.equalTo(red1.mas_right);
     make.bottom.equalTo(red1.mas_bottom);
     }];
     //红2，宽高、左间距、底间距是确定的，添加约束
     [red2 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.height.and.width.equalTo(red1);
     make.leading.equalTo(gray2.mas_right);
     make.bottom.equalTo(red1.mas_bottom);
     }];
     //灰3，左间距、右间距、高度、垂直位置是确定的，添加约束
     [gray3 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.height.and.width.equalTo(gray1);
     make.leading.equalTo(red2.mas_right);
     make.trailing.equalTo(self.view.mas_right);
     make.bottom.equalTo(red1.mas_bottom);
     }];
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
