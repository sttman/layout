//
//  ViewController.m
//  layout
//
//  Created by shitaotao on 16/1/26.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "SetPersonalCenterController.h"

@interface SetPersonalCenterController ()

@end

@implementation SetPersonalCenterController
// 这个可以自行理解，以巩固
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc] init];
    redView.layer.cornerRadius = 45;
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 90));
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(30);
    }];
    UILabel *iconLable =[[UILabel alloc] init];
    iconLable.text = @"上传头像";
    iconLable.tintColor = [UIColor blackColor];
    [self.view addSubview:iconLable];
    [iconLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(redView);
        make.top.equalTo(redView.mas_bottom).with.offset(10);
    }];
    //社团编辑图标
    UIImageView *editIcon = [[UIImageView alloc]init];
    editIcon.backgroundColor = [UIColor grayColor];
    [self.view addSubview:editIcon];
    
    [editIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 40));
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(iconLable.mas_bottom).with.offset(30);
    }];
    
    UITextField *namefield= [[UITextField alloc] init];
    namefield.placeholder = @"请输入社团名";
    [self.view addSubview:namefield];
    [namefield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editIcon);
        make.right.equalTo(self.view).with.offset(-10);
        make.left.equalTo(editIcon.mas_right).with.offset(5);
        make.height.mas_equalTo(editIcon);
    }];
    
    UILabel *line = [[UILabel alloc] init];
    line.backgroundColor =[UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(namefield.mas_bottom).with.offset(3);
        make.height.mas_equalTo(2);
    }];
    
    UILabel *state = [[UILabel alloc] init];
    state.text = @"选择标签";
    [self.view addSubview:state];
    [state mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
        make.top.equalTo(namefield.mas_bottom).with.offset(20);
    }];
    
    UITextField *beat =[[UITextField alloc] init];
    beat.placeholder = @"美容颜";
    [self.view addSubview:beat];
    [beat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(state.mas_right).with.offset(10);
        make.height.equalTo(state);
        make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(state);
    }];
    
    UILabel *beatLable =[[UILabel alloc] init];
    beatLable.text = @"美容颜";
    beatLable.textAlignment = NSTextAlignmentCenter;
    beatLable.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:beatLable];
    [beatLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(state);
        make.top.equalTo(beat.mas_bottom).with.offset(10);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(60);
    }];
    
    UILabel *ROULable = [[UILabel alloc] init];
    ROULable.text = @"肉肉帮";
    ROULable.backgroundColor = [UIColor orangeColor];
    ROULable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:ROULable];
    [ROULable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(beatLable.mas_right).with.offset(10);
        make.top.equalTo(beatLable);
        make.size.equalTo(beatLable);
    }];
    
    UILabel *english = [[UILabel alloc] init];
    english.text = @"DGDFGDSGFDFSGSDFGD";
    english.textAlignment = NSTextAlignmentCenter;
    english.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:english];
    [english mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ROULable.mas_right).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(ROULable);
        make.height.equalTo(ROULable);
    }];
    
    UIButton *enter =[[UIButton alloc] init];
    [enter setTitle:@"确定" forState:UIControlStateNormal];
    enter.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:enter];
    [enter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(40);
        make.top.equalTo(english.mas_bottom).with.offset(30);
        make.height.mas_equalTo(40);
        make.right.equalTo(self.view).with.offset(-40);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
}

@end
