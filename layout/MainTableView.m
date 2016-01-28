//
//  MainTableView.m
//  layout
//
//  Created by shitaotao on 16/1/28.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "MainTableView.h"

#import "SetPersonalCenterController.h"
#import "BasicController.h"
#import "RemoverViewController.h"

@interface MainTableView ()

@property (nonatomic, strong) NSArray * dataController;

@end

@implementation MainTableView

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.dataController = @[
                            [[BasicController alloc]initWithTitle:@"基础使用"],
                            [[SetPersonalCenterController alloc]initWithTitle:@"设置个人中心界面"],
                            [[RemoverViewController alloc]initWithTitle:@"删除view"]
                            ];
}

#pragma mark - table view DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataController.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"identifier";
    UIViewController * viewController = self.dataController[indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = viewController.title;
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController = self.dataController[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end
