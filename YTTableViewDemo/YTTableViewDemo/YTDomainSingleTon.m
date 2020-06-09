//
//  YTDomainSingleTon.m
//  YTTableViewDemo
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "YTDomainSingleTon.h"

@implementation YTDomainSingleTon
+ (instancetype)sharedSingleton {
    static YTDomainSingleTon *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

@end
