//
//  Edge.m
//  dsp
//
//  Created by Zachary Drossman on 6/16/14.
//  Copyright (c) 2014 Zach Drossman. All rights reserved.
//

#import "Edge.h"

@implementation Edge

- (instancetype)initWithEdgeString:(NSString *)edgeString
{
    self = [super init];
    if (self) {
        self.endPoint = [[edgeString substringToIndex:[edgeString rangeOfString:@","].location - 1] integerValue];
        self.distanceFromStart = [[edgeString substringFromIndex:[edgeString rangeOfString:@","].location + 1] integerValue];
    }
    return self;
}

@end
