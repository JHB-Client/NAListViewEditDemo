//
//  YTDomainChangeCell.m
//  YTTableViewDemo
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "YTDomainChangeCell.h"
#import "YTDomain.h"
@interface YTDomainChangeCell()
@property (nonatomic, strong) UILabel *domainNameLabel;
@property (nonatomic, strong) UILabel *domainStateLabel;
@end

@implementation YTDomainChangeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self.backgroundColor = [UIColor redColor];
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubviews];
    }
    return self;
}


- (void)setUpSubviews {
    CGFloat k_width = [UIScreen mainScreen].bounds.size.width;
    self.domainNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, k_width * 0.7, self.bounds.size.height)];
    self.domainNameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.domainNameLabel];
    self.domainStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(k_width * 0.7, 0, k_width * 0.3, self.bounds.size.height)];
    self.domainStateLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.domainStateLabel];
}

- (void)layoutSubviews {
    self.domainNameLabel.text = self.domain.name;
    if (self.domain.state == true) {
        self.domainStateLabel.textColor = [UIColor redColor];
        self.domainStateLabel.text = @"在使用";
    } else {
        self.domainStateLabel.textColor = [UIColor blackColor];
        self.domainStateLabel.text = @"未使用";
    }
}

- (void)setDomain:(YTDomain *)domain {
    _domain = domain;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellId = @"domainCell";
     YTDomainChangeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

@end
