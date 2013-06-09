//
//  AccountCreateWebView.h
//  TOAppEx
//
//  Created by tomohiko on 2013/06/09.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AccountCreateWebViewDelegate
- (void)accountCreateRetrun;
@end

@interface AccountCreateWebView : UIViewController <UIWebViewDelegate> {
  UIWebView *_webView;
  UINavigationController *_navi;
}
@property (nonatomic, assign) id<AccountCreateWebViewDelegate>delegate;

@end
