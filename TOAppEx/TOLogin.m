//
//  TOLogin.m
//  TOAppEx
//
//  Created by tomohiko on 2013/05/20.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "TOLogin.h"

@interface TOLogin ()

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
  _passTextField.delegate = self;
  return textField;
}
- (void)viewDidLoad {
  [super viewDidLoad];
 
  //Logo BackGround Image

  _idTextField = [self makeIdTextField:CGRectMake(10, 200, 300, 32) text:@""];
  
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
