//
//  WebViewController.h
//  TOAppEx
//
//  Created by TomohikoYamada on 13/05/24.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WebViewControllerDelegate
- (void)homePush;
@end

@interface WebViewController : UIViewController <UIWebViewDelegate> {
  UIWebView               *_wv;
  UIActivityIndicatorView *_activityIndicator;
  UIBarButtonItem         *_reloadButton;
  UIBarButtonItem         *_backButton;
  UIBarButtonItem         *_fowardButton;
  UIBarButtonItem         *_homeButton;
}

@property (nonatomic, assign) id<WebViewControllerDelegate>delegate;
@property (strong, nonatomic) UIWebView *wv;
@property (nonatomic, retain) NSString  *encode_word;
- (void)tohome:(id)sender;
//- (void)tohome;
- (void)reloadDidPush;
- (void)backDidPush;
- (void)fowardDidPush;

@end
