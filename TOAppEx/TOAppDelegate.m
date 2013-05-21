//
//  TOAppDelegate.m
//  TOAppEx
//
//  Created by tomohiko on 2013/05/19.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "TOAppDelegate.h"
#import "RootViewController.h"

@implementation TOAppDelegate

- (void)dealloc {
  [_navigationController release];
  [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  
  RootViewController *rootView = [[[RootViewController alloc] init] autorelease];
  _navigationController = [[UINavigationController alloc] initWithRootViewController:rootView];
  self.window.rootViewController = _navigationController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
