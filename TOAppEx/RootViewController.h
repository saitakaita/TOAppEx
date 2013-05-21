//
//  RootViewController.h
//  TOAppEx
//
//  Created by tomohiko on 2013/05/20.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TOLogin.h"

@interface RootViewController : UITableViewController<TLoginDelegate> {
  UIWindow *_window;
  NSArray *_lists;
  NSString *flagTest;
}

@property (nonatomic, retain) NSArray *lists;

@end
