//
//  RootViewController.m
//  TOAppEx
//
//  Created by tomohiko on 2013/05/20.
//  Copyright (c) 2013年 jp.main.yamato. All rights reserved.
//

#import "RootViewController.h"
#import "UserId.h"

@interface RootViewController ()

- (void)login:(NSString *)text;

@end

@implementation RootViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  flagTest = nil;
  
  if (flagTest == nil) {
    TOLogin *login = [[TOLogin alloc] init];
    UINavigationController *navigationCtr = [[UINavigationController alloc] initWithRootViewController:login];
    navigationCtr.navigationBarHidden = YES;
    login.delegate = self;
    [login setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:navigationCtr animated:NO completion:nil];
    [login release];
  }
  self.title = @"Menu";
  
  self.lists = [NSArray arrayWithObjects:
                @"TMemoViewController",
                @"WebSearchController",
                nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.lists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  NSString *title = [self.lists objectAtIndex:indexPath.row];
  cell.textLabel.text = [title stringByReplacingOccurrencesOfString:@"SampleFor" withString:@""];

  return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *className = [self.lists objectAtIndex:indexPath.row];
  Class class = NSClassFromString(className);
  id viewController = [[[class alloc] init] autorelease];
  if (!viewController) {
    localeconv();
  }
  [self.navigationController pushViewController:viewController animated:YES];
}

- (void)login:(NSString *)text {
  
  
  
  [self.navigationController dismissViewControllerAnimated:YES completion:NULL];


}



@end
