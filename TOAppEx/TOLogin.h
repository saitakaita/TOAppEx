//
//  TOLogin.h
//  TOAppEx
//
//  Created by tomohiko on 2013/05/20.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserId;

@protocol TLoginDelegate
- (void)login:(NSString *)text;

@end

@interface TOLogin : UIViewController <UITextFieldDelegate> {
  UITextField *_idTextField;
  UITextField *_pwTextField;
}
@property (nonatomic, assign) id<TLoginDelegate>delegate;
@property (nonatomic, retain) UserId *idPass;

@end
