//
//  TOLogin.m
//  TOAppEx
//
//  Created by tomohiko on 2013/05/20.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "TOLogin.h"
#import "UserId.h"
#define LOGIN_FLG   @"OK"
#define BTN_LOGIN   1

@interface TOLogin ()
- (void)login:(id)sender;

@end

@implementation TOLogin

- (void)dealloc {
  self.idPass = nil;
  
  [super dealloc];
}

- (UITextField *)makeIdTextField:(CGRect)rect text:(NSString *)text {
  UITextField *username = [[[UITextField alloc] init]autorelease];
  [username setText:text];
  [username setFrame:rect];
  [username setReturnKeyType:UIReturnKeyNext];
  [username setBackgroundColor:[UIColor whiteColor]];
  [username setBorderStyle:UITextBorderStyleRoundedRect];
  _idTextField.delegate = self;
  return username;
}

- (UITextField *)makePassTextField:(CGRect)rect text:(NSString *)text {
  UITextField *textField = [[[UITextField alloc] init]autorelease];
  [textField setText:text];
  [textField setFrame:rect];
  [textField setSecureTextEntry:YES];
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
//  [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
  [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
  
  return button;
}

- (void)viewDidLoad {
  [super viewDidLoad];

//  UIImage *imageV = [UIImage imageNamed:@"login.png"];
//  [imageV drawAtPoint:CGPointMake(0, 0)];
  
  
//  [imageV release];
  
  UIImage *bgImage = [UIImage imageNamed:@"login.png"];
//  UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
//  backgroundView.backgroundColor = [UIColor blackColor];
  self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
  
//  backgroundView.backgroundColor = [UIColor colorWithPatternImage:bgImage];
  //[bgImage release];
  //logo backgroundimage etc
  //login textfield
  _idTextField = [self makeIdTextField:CGRectMake(10, 150, 300, 32) text:@"yamada"];
  _pwTextField = [self makePassTextField:CGRectMake(10, 200, 300, 32) text:@"yamada10"];
  UIButton *btn = [self makeButton:CGRectMake(60, 250, 200, 40) text:@"login" tag:BTN_LOGIN];
  
  [self.view addSubview:btn];
  [self.view addSubview:_idTextField];
  [self.view addSubview:_pwTextField];

}

- (void)login:(id)sender {
  [_pwTextField resignFirstResponder];
  NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
  [mutableDic setValue:_idTextField.text forKey:@"username"];
  [mutableDic setValue:_pwTextField.text forKey:@"passwd"];
  LOG(@"mutableDic:%@",mutableDic);
  NSError *error = nil;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mutableDic options:kNilOptions error:&error];
  NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  
  NSURL *url = [NSURL URLWithString:@"http://yamato.main.jp/app/json/api.php"];
  
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  NSData *requestData = [NSData dataWithBytes:[jsonStr UTF8String] length:[jsonStr length]];
  [request setHTTPMethod:@"POST"];
  [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
  [request setHTTPBody:requestData];
  
  [NSURLConnection connectionWithRequest:request delegate:self];
  
//  [self.delegate login:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  NSMutableData *success = [NSMutableData data];
  LOG(@"success:%@",success);
  [success appendData:data];
  NSString *response = [[NSString alloc] initWithData:success encoding:NSASCIIStringEncoding];
  LOG(@"Data:%@",response);
  if ([response isEqualToString:@"OK"]) {
    [self.delegate login:nil];
  } else {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"error";
    alert.message = @"usernameが違います";
    [alert addButtonWithTitle:@"確認"];
    [alert show];
    
  }
}


@end
