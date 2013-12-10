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
#import "UIImageView+AFNetworking.h"
#import "GTMNSString+HTML.h"

#define URL @"http://www.kku.ac.th/ikku_apps/ios/news-list.html#/"

@interface NewsViewController () <APIDelegate, UIWebViewDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation NewsViewController
{
    API *api;
    BOOL isShowDetail;
    NSArray *DATA;
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
    
    api = [API new];
    [api setDelegate:self];
    [api getNews];
    
    [_tableViewNews setDataSource:self];
    [_tableViewNews setDelegate:self];
    
    [_webViewDetail setDelegate:self];
    
    [_tableViewNews setHidden:NO];
    [_scrollViewDetail setHidden:YES];
    [_btnBack setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - TableView DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [DATA count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    
    NSDictionary *dict = DATA[indexPath.row];
    
    [cell configCell:dict];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = DATA[indexPath.row];
    
    [_imageViewNews setImageWithURL:[NSURL URLWithString:[[dict valueForKey:@"picnewsUrl"] objectAtIndex:0]]];
    [_labelDate setText:[dict valueForKey:@"date"]];
    [_labelTitle setText:[dict valueForKey:@"title"]];
    
    NSString *detail = [NSString stringWithFormat:@"<html><body>%@</body></html>", [dict valueForKey:@"detail"]];
    detail = [detail gtm_stringByUnescapingFromHTML];
    [_webViewDetail loadHTMLString:detail baseURL:nil];
    
    [_scrollViewDetail setHidden:NO];
    
    [Effect slideRightToLeft:_scrollViewDetail duration:0.3 delay:0 completion:^(BOOL finished) {
        [_btnBack setHidden:NO];
    }];
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

# pragma mark - APIDelaget
- (void)getNewsCompleted:(NSObject *)result
{
    DATA = [result valueForKey:@"news"];
    [_tableViewNews reloadData];
}

# pragma mark - onClick
- (IBAction)onClickBack:(UIButton *)sender
{
    [_btnBack setHidden:YES];
    CGRect frame = [_scrollViewDetail frame];
    [Effect slideLeftToRight:_scrollViewDetail duration:0.3 delay:0 completion:^(BOOL finished) {
        [_scrollViewDetail setHidden:YES];
        [_scrollViewDetail setFrame:frame];
        isShowDetail = NO;
    }];
}
- (IBAction)onClickRefresh:(UIButton *)sender
{
    [self viewDidLoad];
}

@end
