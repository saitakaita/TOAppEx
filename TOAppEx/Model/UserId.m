//
//  UserId.m
//  TOAppEx
//
//  Created by TomohikoYamada on 13/05/23.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "UserId.h"

@implementation UserId

- (void)dealloc {
  self.userId = nil;
  self.passWord = nil;

  [super dealloc];
}

@end
