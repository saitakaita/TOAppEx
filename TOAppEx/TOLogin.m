//
//  TOLogin.m
//  TOAppEx
//
//  Created by tomohiko on 2013/05/20.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "TOLogin.h"
#import "UserId.h"
#import "AccountCreateWebView.h"
#define LOGIN_FLG   @"OK"
#define BTN_LOGIN   1

@interface TOLogin ()
- (void)login:(id)sender;
- (void)accountCreate:(id)sender;
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

//- (UIButton *)makeButton:(CGRect)rect text:(NSString *)text tag:(int)tag {
//  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//  [button setFrame:rect];
//  [button setTitle:text forState:UIControlStateNormal];
//  [button setTag:tag];
////  [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
//  [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
//  
//  return button;
//}

//+ (UIImage *)getImageNamed:(NSString *)imageName {
//  NSMutableString *imageNameMutable = [[imageName mutableCopy] autorelease];
//  CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
//  if ([UIScreen mainScreen].scale == 2.0f && screenHeight == 568.0f) {
//    NSRange dot = [imageName rangeOfString:@"."]
//    ;
//    if (dot.location != NSNotFound) {
//      [imageNameMutable insertString:@"-568h" atIndex:dot.location];
//    } else {
//      [imageNameMutable appendString:@"-568h"];
//    }
//  }
//  UIImage *image = [UIImage imageNamed:imageNameMutable];
//  if (!image) {
//    image = [UIImage imageNamed:imageName];
//  }
//  return image;
//}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //  UIAlertView *alert = [[UIAlertView alloc]init];
//  UIImage *image;
//  CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
//  if ([UIScreen mainScreen].scale == 2.f && screenHeight == 568.0f) {
//    alert.delegate = self;
//    alert.title = @"retina";
//    [alert addButtonWithTitle:@"cancel"];
//    [alert addButtonWithTitle:@"yes"];
//    alert.cancelButtonIndex = 0;
//    image = [UIImage imageNamed:@"p-568h@2x.png"];
//  } else {
//    alert.title = @"3gs";
//    [alert addButtonWithTitle:@"cancel"];
//    [alert addButtonWithTitle:@"yes"];
//    alert.cancelButtonIndex = 0;
//    image = [UIImage imageNamed:@"p.png"];
//  }
//  [alert show];
  NSString *bgImgPath = [[NSBundle mainBundle] pathForResource:@"p" ofType:@"png"];
  UIImageView *bgImg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:bgImgPath]];
  [self.view addSubview:bgImg];
  
//  self.view.backgroundColor = [UIColor colorWithPatternImage:image];
//  UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
//  backgroundView.backgroundColor = [UIColor blackColor];
//  self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
  
//  NSString *loginBtnPath = [[NSBundle mainBundle] pathForResource:@"login_btn" ofType:@"png"];
//  UIImageView *loginBtn = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:loginBtnPath]];
//  loginBtn.frame = CGRectMake(65, 250, 175, 25);
  
//  NSString *acBtnPath = [[NSBundle mainBundle] pathForResource:@"create_btn" ofType:@"png"];
//  UIImageView *acBtn = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:acBtnPath]];
//  acBtn.frame = CGRectMake(65, 300, 175, 25);
  
  UIImage *login = [UIImage imageNamed:@"login_btn.png"];
  UIButton *loginButton = [[[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 175) /2, 250, 175, 25)] autorelease];
  [loginButton setContentMode:UIViewContentModeScaleAspectFill];
  [loginButton setImage:login forState:UIControlStateNormal];
  [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
  
  UIImage *account = [UIImage imageNamed:@"create_btn.png"];
  UIButton *createButton = [[[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 175) /2, 300, 175, 25)] autorelease];
  [createButton setContentMode:UIViewContentModeScaleAspectFill];
  [createButton setImage:account forState:UIControlStateNormal];
  [createButton addTarget:self action:@selector(accountCreate:) forControlEvents:UIControlEventTouchUpInside];
  
  _idTextField = [self makeIdTextField:CGRectMake(10, 150, 300, 32) text:@"yamada"];
  _pwTextField = [self makePassTextField:CGRectMake(10, 200, 300, 32) text:@"yamada10"];
  //UIButton *btn = [self makeButton:CGRectMake(60, 250, 200, 40) text:@"login" tag:BTN_LOGIN];
 
  [self.view addSubview:_idTextField];
  [self.view addSubview:_pwTextField];
  [self.view addSubview:loginButton];
  [self.view addSubview:createButton];
//  [self.view addSubview:acBtn];
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

- (void)accountCreate:(id)sender {
  LOG(@"accountCreate");
  AccountCreateWebView *webView = [[AccountCreateWebView alloc] init];
//  UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:webView];
  
  webView.delegate = self;
//  [webView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
  [self.navigationController pushViewController:webView animated:YES];
  [webView release];
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

- (void)accountCreateRetrun {
  LOG(@"accountCreate");
  [self.navigationController setNavigationBarHidden:YES];
  [self.navigationController popViewControllerAnimated:YES];
}

@end
