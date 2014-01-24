//
//  AppDelegate.m
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568) ? YES:NO

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [GMSServices provideAPIKey:@"AIzaSyD8E7t8rJvotjVzI3rcpnEog-t3BXlbBto"];
    
    NSString *model = [UIDevice currentDevice].model;
    if (([model isEqualToString:@"iPhone Simulator"] || [model isEqualToString:@"iPhone"] || [model isEqualToString:@"iPod touch"]) && !isiPhone5) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone_Old" bundle:nil];
        UIViewController *initViewController = [storyBoard instantiateInitialViewController];
        [self.window setRootViewController:initViewController];
        NSLog(@"iPhone_Old");
    }
    NSLog(@"Device Model: %@", [UIDevice currentDevice].model);
    NSLog(@"Device Version: %@", [UIDevice currentDevice].systemName);
    
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
