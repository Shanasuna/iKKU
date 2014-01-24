//
//  EventViewController.m
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "EventViewController.h"
#import "API.h"
#import "Effect.h"
#import "EventCell.h"
#import "YouTubePlayerViewController.h"
#import "EventDetailViewController.h"

#define URL @"http://www.kku.ac.th/ikku_apps/ios/event-list.html#/"

#define DEFAULT_EVENT_NUMBER 10
#define ROW_HEIGHT 90
#define ROW_MORE_HEIGHT 50

@interface EventViewController () <APIDelegate, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate>

@end

@implementation EventViewController
{
    API *api;
    NSArray *DATA;
    BOOL isShowDetail;
    UIRefreshControl *refresh;
    NSInteger eventLimit;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    isShowDetail = NO;
    eventLimit = DEFAULT_EVENT_NUMBER;
    
    api = [API new];
    [api setDelegate:self];
    [API showLoading];
    [api getEventWithLimit:eventLimit];
    
    refresh = [UIRefreshControl new];
    [refresh addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    UITableViewController *tvc = [UITableViewController new];
    [tvc setTableView:_tableViewEvent];
    [tvc setRefreshControl:refresh];
    
    [_tableViewEvent setDataSource:self];
    [_tableViewEvent setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIViewController *vc in self.tabBarController.childViewControllers) {
        if ([vc isKindOfClass:[YouTubePlayerViewController new].class]) {
            [(YouTubePlayerViewController *)vc stopVideo];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onRefresh
{
    eventLimit = DEFAULT_EVENT_NUMBER;
    [api getEventWithLimit:eventLimit];
}

# pragma mark - API Delegate
- (void)getEventCompleted:(NSObject *)result
{
    DATA = [result valueForKey:@"activities"];
    [refresh endRefreshing];
    [_tableViewEvent reloadData];
}

# pragma mark - TableView DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [DATA count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != [DATA count]) {
        return ROW_HEIGHT;
    } else {
        return ROW_MORE_HEIGHT;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != [DATA count]) {
        EventCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
        
        NSDictionary *dict = DATA[indexPath.row];
        
        [cell configCell:dict];
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreBTN" forIndexPath:indexPath];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != [DATA count]) {
        NSDictionary *dict = DATA[indexPath.row];
        [self performSegueWithIdentifier:@"EventDetail" sender:dict];
    } else {
        eventLimit += 10;
        [api getEventWithLimit:eventLimit];
    }
}

# pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EventDetailViewController *dest = [segue destinationViewController];
    [dest setEvent:sender];
}

# pragma mark - WebView Delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    isShowDetail = YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (!isShowDetail) {
        return YES;
        isShowDetail = YES;
    } else {
        return NO;
    }
}

@end
