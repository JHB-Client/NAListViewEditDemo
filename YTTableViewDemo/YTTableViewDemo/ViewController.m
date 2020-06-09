//
//  ViewController.m
//  YTTableViewDemo
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ViewController.h"
#import "YTDomainChangeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YTDomainChangeViewController *vc = [YTDomainChangeViewController new];
    [self.navigationController pushViewController:vc animated:true];
}

@end
