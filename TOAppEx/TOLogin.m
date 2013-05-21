//
//  TOLogin.m
//  TOAppEx
//
//  Created by tomohiko on 2013/05/20.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "TOLogin.h"
#define LOGIN_FLG   @"OK"
#define BTN_LOGIN   1

@interface TOLogin ()
- (void)login:(id)sender;

@end

@implementation TOLogin

- (UITextField *)makeIdTextField:(CGRect)rect text:(NSString *)text {
  UITextField *textField = [[[UITextField alloc] init]autorelease];
  [textField setText:text];
  [textField setFrame:rect];
  [textField setReturnKeyType:UIReturnKeyDone];
  [textField setBackgroundColor:[UIColor whiteColor]];
  [textField setBorderStyle:UITextBorderStyleRoundedRect];
  _idTextField.delegate = self;
  return textField;
}

- (UITextField *)makePassTextField:(CGRect)rect text:(NSString *)text {
  UITextField *textField = [[[UITextField alloc] init]autorelease];
  [textField setText:text];
  [textField setFrame:rect];
  [textField setReturnKeyType:UIReturnKeyDone];
  [textField setBackgroundColor:[UIColor whiteColor]];
  [textField setBorderStyle:UITextBorderStyleRoundedRect];
  _pwTextField.delegate = self;
  return textField;
}

- (UIButton *)makeButton:(CGRect)rect text:(NSString *)text tag:(int)tag {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setFrame:rect];
  [button setTitle:text forState:UIControlStateNormal];
  [button setTag:tag];
  [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
  
  return button;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //logo backgroundimage etc
  
  //login textfield
  _idTextField = [self makeIdTextField:CGRectMake(10, 100, 300, 32) text:@"test"];
  _pwTextField = [self makePassTextField:CGRectMake(10, 150, 300, 32) text:@"test"];
  UIButton *btn = [self makeButton:CGRectMake(60, 200, 200, 40) text:@"login" tag:BTN_LOGIN];
  [self.view addSubview:btn];
  [self.view addSubview:_idTextField];
  [self.view addSubview:_pwTextField];
}

- (void)login:(id)sender {
  LOG(@"test");
  [self.delegate login:nil];

}


@end
