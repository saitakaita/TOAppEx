//
//  Util.h
//  TOAppEx
//
//  Created by TomohikoYamada on 13/05/24.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

+ (NSString *)urlencode:(NSString *)text;
+ (NSString *)urldecode:(NSString *)text;

@end
