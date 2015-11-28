//
//  AppDelegate.m
//  Checklists
//
//  Created by VoidWu on 15/11/25.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import "AppDelegate.h"
#import "AllListsViewController.h"
#import "DataModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate{
    DataModel *_dataModel;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    _dataModel = [[DataModel alloc]init];
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    AllListsViewController *controller = navigationController.viewControllers[0];
    controller.dataModel = _dataModel;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

-(void)saveData{
    
    //根据self.window属性找到包含了storyboard的UIWindow对象。UIWindow 是应用所有视图的总容器。每个应用中只有1个UIWindow对象(和桌面应用不同,通常有多个窗口对象,iOS应用中有且只有1个UIWindow对象!!!
//    UINavigationController *navigationController = (UINavigationController*)self.window.rootViewController;
//    AllListsViewController *controller = navigationController.viewControllers[0];
//    [controller saveChecklists];
    [_dataModel saveChecklists];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [self saveData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self saveData];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
