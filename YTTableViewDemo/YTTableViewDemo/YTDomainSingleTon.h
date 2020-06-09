//
//  YTDomainSingleTon.h
//  YTTableViewDemo
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YTDomain;
NS_ASSUME_NONNULL_BEGIN

@interface YTDomainSingleTon : NSObject
+ (instancetype)sharedSingleton;
@property (nonatomic, strong) NSMutableArray<YTDomain *> *domainArr;
@property (nonatomic, strong) YTDomain *lastSelectedDomain;
@end

NS_ASSUME_NONNULL_END
