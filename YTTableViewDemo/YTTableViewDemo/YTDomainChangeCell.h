//
//  YTDomainChangeCell.h
//  YTTableViewDemo
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTDomain;
NS_ASSUME_NONNULL_BEGIN

@interface YTDomainChangeCell : UITableViewCell
@property (nonatomic, strong) YTDomain *domain;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
