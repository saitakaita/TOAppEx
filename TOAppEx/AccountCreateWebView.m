//
//  AccountCreateWebView.m
//  TOAppEx
//
//  Created by tomohiko on 2013/06/09.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "AccountCreateWebView.h"

@interface AccountCreateWebView ()

@end

@implementation AccountCreateWebView

-(void)dealloc {
  [_webView release]; _webView.delegate = nil;

  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  LOG(@"AccountCreate");
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  self.navigationController.navigationBar.tintColor = [UIColor blackColor];
  self.title = @"ユーザー登録";
  
  UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
  self.navigationItem.leftBarButtonItem = cancelButton;
  [cancelButton release];
  
  _webView = [[UIWebView alloc] init];
  _webView.frame = self.view.bounds;
  _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  _webView.scalesPageToFit = YES;
  [self.view addSubview:_webView];
  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://yamato.main.jp/app/register/index.php"]];
  [_webView loadRequest:request];

}

- (void)cancel:(id)sender {
  NSLog(@"cancel:push");
  [self.delegate accountCreateRetrun];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
