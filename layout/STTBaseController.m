//
//  STTBaseController.m
//  layout
//
//  Created by shitaotao on 16/1/28.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "STTBaseController.h"

@implementation STTBaseController

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
    }
    
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([[UIDevice currentDevice] systemVersion].doubleValue >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

@end
