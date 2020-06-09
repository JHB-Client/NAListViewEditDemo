//
//  YTDomainChangeViewController.m
//  YTTableViewDemo
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "YTDomainChangeViewController.h"
#import "YTDomainChangeCell.h"
#import "YTDomain.h"
#import "YTDomainSingleTon.h"
@interface YTDomainChangeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<YTDomain *> *domainArr;
@property (nonatomic, assign) YTDomain *lastDomain;
@end

@implementation YTDomainChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"域名切换";
    //
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self.view addSubview:self.tableView];
    // 设置rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showDomainAlert)];
    //
    NSMutableArray<YTDomain *> *domainArr = [YTDomainSingleTon sharedSingleton].domainArr;
    if (domainArr != nil) {
        self.domainArr = domainArr;
    }
    
    if ([YTDomainSingleTon sharedSingleton].lastSelectedDomain == nil) {
        self.lastDomain = self.domainArr.firstObject;
    } else {
        self.lastDomain = [YTDomainSingleTon sharedSingleton].lastSelectedDomain;
    }
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [YTDomainSingleTon sharedSingleton].domainArr = self.domainArr;
    [YTDomainSingleTon sharedSingleton].lastSelectedDomain = self.lastDomain;
}

- (NSMutableArray<YTDomain *> *)domainArr {
    if (_domainArr == nil) {
        _domainArr = [NSMutableArray array];
        YTDomain *domain = [YTDomain new];
        domain.name = @"https://rout_xxxxxx";
        domain.state = true;
        [self.domainArr addObject:domain];
    }
    return _domainArr;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.domainArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YTDomainChangeCell *cell = [YTDomainChangeCell cellWithTableView:tableView];
    cell.domain = [self.domainArr objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YTDomain *domain = [self.domainArr objectAtIndex:indexPath.row];
    if ([self.lastDomain isEqual:domain]) return;
    self.lastDomain.state = false;
    domain.state = true;
    self.lastDomain = domain;
    [self.tableView reloadData];
}

- (void)showDomainAlert {
    UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:@"新域名" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertCtr addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入要切换的域名";
    }];
    
    [alertCtr addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [alertCtr addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *domainName = alertCtr.textFields.firstObject.text;
        YTDomain *domain = [YTDomain new];
        domain.name = domainName;
        domain.state = false;
        [self.domainArr addObject:domain];
        //
        [self.tableView reloadData];
        NSLog(@"--wwwww----:%@", self.domainArr);
    }]];
    
    [self presentViewController:alertCtr animated:true completion:nil];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) return true;
    return false;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.domainArr removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
