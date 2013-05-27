//
//  Util.m
//  TOAppEx
//
//  Created by TomohikoYamada on 13/05/24.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (NSString *)urlencode:(NSString *)text {
  NSString *str = (NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                      NULL,
                                                                      (CFStringRef)text,
                                                                      NULL,
                                                                      (CFStringRef)@"!*'();:@&=+$,/?%#[]~",
                                                                      kCFStringEncodingUTF8);
  
  return str;
}

+ (NSString *)urldecode:(NSString *)text {
  NSString *str = (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                                      NULL,
                                                                                      (CFStringRef)text,
                                                                                      CFSTR(""),
                                                                                      kCFStringEncodingUTF8);
  
  return str;
}

@end
