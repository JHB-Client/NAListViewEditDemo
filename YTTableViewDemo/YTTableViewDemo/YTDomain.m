//
//  YTDomain.m
//  YTTableViewDemo
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "YTDomain.h"

@implementation YTDomain
//编码方法，当对象被编码成二进制数据时调用。
-(void)encodeWithCoder:(NSCoder *)aCoder {
    //在编码方法中，需要对对象的每一个属性进行编码。
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_state forKey:@"state"];
}

//解码方法，当把二进制数据转成对象时调用。
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    //如果父类也遵守NSCoding协议，那么需要写self = [super initWithCoder]
    self = [super init];
    if (self) {
        _name = [[aDecoder decodeObjectForKey:@"name"] copy];
        _state = [aDecoder decodeIntForKey:@"state"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@----state:%d", self.name, self.state];
}

@end
