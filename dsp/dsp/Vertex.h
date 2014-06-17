//
//  Vertex.h
//  dsp
//
//  Created by Zachary Drossman on 6/16/14.
//  Copyright (c) 2014 Zach Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Edge.h"

@interface Vertex : NSObject

@property (nonatomic) NSInteger node;
@property (strong, nonatomic) NSArray *edges;

@end
