//
//  WebSearchController.m
//  TOAppEx
//
//  Created by TomohikoYamada on 13/05/24.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "WebSearchController.h"
#import "WebViewController.h"

@interface WebSearchController ()

@property (retain, nonatomic) UITableView *tableView;

@end

@implementation WebSearchController {
  @private
  UITextField *tf;
  NSMutableArray *wArray;
  NSMutableArray *tArray;
  
  NSMutableArray *dateSection;
  NSString *iData;
}

@synthesize tableView = _tableView;

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
  tf = [[UITextField alloc] initWithFrame:CGRectMake(35, 65, 250, 30)];
  tf.borderStyle = UITextFieldViewModeAlways;
  tf.returnKeyType = UIReturnKeySearch;
  tf.placeholder = @"検索";
  tf.clearButtonMode = UITextFieldViewModeAlways;
  [tf addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventEditingDidEndOnExit];
  [self.view addSubview:tf];

  _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 320, 365)];
  _tableView.dataSource = self;
  _tableView.delegate = self;
  [self.view addSubview:_tableView];
  
  NSArray *paths = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 320, 365) style:UITableViewStyleGrouped];
  NSString *dir  = [paths objectAtIndex:0];
  FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"searchLog.sqlite"]];
 
  dateSection = [[NSMutableArray alloc] init];
  
  [db open];
  
  FMResultSet *fResult = [db executeQuery:@"select distinct date from words order by id desc"];
  while ([fResult next]) {
    iData = [fResult stringForColumn:@"date"];
    [dateSection addObject:iData];
  }
  [db close];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [tf resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return dateSection.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
  for (int i = 0; i < [dateSection count]; i++) {
    if (section == i) {
      NSString *str = [[NSString alloc] initWithFormat:@"%@ 検索履歴",[dateSection objectAtIndex:i]];
      return str;
    }
  }
  return 0;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
