//
//  LinksTableViewController.m
//  searchLinksVisualWeb
//
//  Created by Joan Fabregat Bellido on 05/06/15.
//  Copyright (c) 2015 Joan Fabregat Bellido. All rights reserved.
//

#import "LinksTableViewController.h"
#import "SearcherLinksWeb.h"
#import "common.h"
@interface LinksTableViewController ()

@end

@implementation LinksTableViewController
{
    NSArray * matchs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - methods
/**
 This method makes all the operations are in the background. This way, the process does not affect application.
 */
-(void)loadInfo{
    NSOperationQueue *queue;
    NSBlockOperation *completionOperation;
    queue = [[NSOperationQueue alloc] init];
    completionOperation = [NSBlockOperation blockOperationWithBlock:^{
        matchs =[[SearcherLinksWeb sharedInstance]getMatches];
        if ([matchs count] > 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            NSLog(@"%@\n %@",NSLocalizedString(@"message result",@"message for screen"), matchs);
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"title alert",@"title") message:NSLocalizedString(@"message alert",@"content message") delegate:self cancelButtonTitle:NSLocalizedString(@"button alert",@"text button") otherButtonTitles: nil];
            [alert show];
        }
    }];
    [queue addOperation:completionOperation];
}
#pragma mark - Alert view methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self loadInfo];
    }
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [matchs count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[common getIdentifierCellLink] forIndexPath:indexPath];
    cell.textLabel.text = [matchs objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // open url with Safari application
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[matchs objectAtIndex:indexPath.row]]];
}
@end
