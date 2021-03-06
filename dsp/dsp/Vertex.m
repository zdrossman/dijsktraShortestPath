//
//  Vertex.m
//  dsp
//
//  Created by Zachary Drossman on 6/16/14.
//  Copyright (c) 2014 Zach Drossman. All rights reserved.
//

#import "Vertex.h"
#import "Edge.h"
@implementation Vertex

-(NSArray *)edges
{
    if (!_edges) _edges = [[NSArray alloc] init];
    return _edges;
}

-(instancetype)initWithDataString:(NSString *)dataString
{
    self = [super init];
    
    if (self)
    {
        self.node = [[dataString substringToIndex:[dataString rangeOfString:@","].location] integerValue];
        
        NSString *newDataString = [dataString substringFromIndex:[dataString rangeOfString:@"\t"].location + 1];

        NSArray *roughEdges = [newDataString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSMutableArray *smoothEdges = [[NSMutableArray alloc] initWithCapacity:20];
        
        for (NSString *edgeString in roughEdges)
        {
            if (![edgeString isEqualToString:@""])
            {
                Edge *edge = [[Edge alloc] initWithEdgeString:edgeString];
                [smoothEdges addObject:edge];
            }
        }
        
        self.edges = smoothEdges;
        
    }
    return self;
}
@end
