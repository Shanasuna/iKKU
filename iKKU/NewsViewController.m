//
//  NewsViewController.m
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "NewsViewController.h"
#import "API.h"
#import "Effect.h"
#import "NewsCell.h"
#import "YouTubePlayerViewController.h"
#import "NewsDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "GTMNSString+HTML.h"

#define URL @"http://www.kku.ac.th/ikku_apps/ios/news-list.html#/"

#define DEFAULT_NEWS_NUMBER 10
#define ROW_HEIGHT 90
#define ROW_MORE_HEIGHT 50

@interface NewsViewController () <APIDelegate, UIWebViewDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation NewsViewController
{
    API *api;
    BOOL isShowDetail;
    NSArray *DATA;
    UIRefreshControl *refresh;
    NSInteger newsLimit;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    canGoBack = NO;
//    [_webViewNews setScalesPageToFit:YES];
//    [_webViewNews setDelegate:self];
//    [_btnBack setHidden:YES];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
//    [_webViewNews loadRequest:request];
//    [API showLoading];
    
    isShowDetail = NO;
    newsLimit = DEFAULT_NEWS_NUMBER;
    
    api = [API new];
    [api setDelegate:self];
//    [API showLoading];
    [api getNewsWithLimit:newsLimit];
    
    refresh = [UIRefreshControl new];
    [refresh addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    UITableViewController *tvc = [UITableViewController new];
    [tvc setTableView:_tableViewNews];
    [tvc setRefreshControl:refresh];
    
    [_tableViewNews setDataSource:self];
    [_tableViewNews setDelegate:self];
    
    [_tableViewNews setHidden:NO];
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
    
    NSLog(@"News Memory Warning");
}

- (void)onRefresh
{
    newsLimit = DEFAULT_NEWS_NUMBER;
    [api getNewsWithLimit:newsLimit];
}

# pragma mark - TableView DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [DATA count] + 1;
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
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
        
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
        [self performSegueWithIdentifier:@"NewsDetail" sender:dict];
    } else {
        newsLimit += 10;
        [api getNewsWithLimit:newsLimit];
    }
}

# pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NewsDetailViewController *dest = [segue destinationViewController];
    [dest setNews:sender];
}

# pragma mark - WebViewDelegate
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

# pragma mark - APIDelegate
- (void)getNewsCompleted:(NSObject *)result
{
    DATA = [result valueForKey:@"news"];
    [refresh endRefreshing];
    [_tableViewNews reloadData];
}

@end
