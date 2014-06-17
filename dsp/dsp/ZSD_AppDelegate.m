//
//  ZSD_AppDelegate.m
//  dsp
//
//  Created by Zachary Drossman on 6/16/14.
//  Copyright (c) 2014 Zach Drossman. All rights reserved.
//

#import "ZSD_AppDelegate.h"
#import "Edge.h"
#import "Vertex.h"

@implementation ZSD_AppDelegate

- (void)importDataset
{
    NSString *str;
    self.vertices = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dijkstraData" ofType:@"txt"];
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    
    if (myData)
    {
        str = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
        
        NSArray *initialArray = [str componentsSeparatedByCharactersInSet:[NSCharacterSet  newlineCharacterSet]];
        
        for (NSString *dataString in initialArray)
        {
            if (![dataString isEqualToString:@""])
            {
            Vertex *vertex = [[Vertex alloc] init];
            
            vertex.node = [[dataString substringToIndex:[dataString rangeOfString:@","].location] integerValue];
            
            NSString *newDataString = [dataString substringFromIndex:[dataString rangeOfString:@"\t"].location + 1];
            
            NSArray *roughEdges = [newDataString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSMutableArray *smoothEdges = [[NSMutableArray alloc] initWithCapacity:20];
            
            for (NSString *edgeString in roughEdges)
            {
               if (![edgeString isEqualToString:@""])
               {
                Edge *edge = [[Edge alloc] init];
                edge.endPoint = [[edgeString substringToIndex:[edgeString rangeOfString:@","].location - 1] integerValue];
                edge.distanceFromStart = [[edgeString substringFromIndex:[edgeString rangeOfString:@","].location + 1] integerValue];
                
                [smoothEdges addObject:edge];
               }
            }
            
            vertex.edges = smoothEdges;
            
            [self.vertices addObject:vertex];
            }
        }
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self importDataset];
    //[self runDijkstra];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
