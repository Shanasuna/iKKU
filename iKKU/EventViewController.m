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
#import "ChannelViewController.h"
#import "UIImageView+AFNetworking.h"
#import "GTMNSString+HTML.h"

#define URL @"http://www.kku.ac.th/ikku_apps/ios/event-list.html#/"

@interface EventViewController () <APIDelegate, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate>

@end

@implementation EventViewController
{
    API *api;
    NSArray *DATA;
    BOOL isShowDetail;
    UIRefreshControl *refresh;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    isShowDetail = NO;
    
    api = [API new];
    [api setDelegate:self];
    [API showLoading];
    [api getEvent];
    
    refresh = [UIRefreshControl new];
    [refresh addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    UITableViewController *tvc = [UITableViewController new];
    [tvc setTableView:_tableViewEvent];
    [tvc setRefreshControl:refresh];
    
    [_tableViewEvent setDataSource:self];
    [_tableViewEvent setDelegate:self];
    
    [_webViewDetail setDelegate:self];
    
    for (UIView *view in [_scrollViewEvent subviews]) {
        [view removeFromSuperview];
    }
    [_scrollViewEvent addSubview:_viewScrollContent];
    [_scrollViewEvent setContentSize:CGSizeMake(_viewScrollContent.frame.size.width, _viewScrollContent.frame.size.height)];
  
    [_tableViewEvent setHidden:NO];
    [_btnBack setHidden:YES];
    [_scrollViewEvent setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIViewController *vc in self.tabBarController.childViewControllers) {
        if ([vc isKindOfClass:[ChannelViewController new].class]) {
            [(ChannelViewController *)vc stopVideo];
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
    [api getEvent];
}

- (NSString *)parseDate:(NSString *)date
{
    NSArray *split = [date componentsSeparatedByString:@"-"];
    NSInteger m = [[split objectAtIndex:1] integerValue];
    NSString *month;
    
    if (m == 1) {
        month = @"ม.ค.";
    } else if (m == 2) {
        month = @"ก.พ.";
    } else if (m == 3) {
        month = @"มี.ค.";
    } else if (m == 4) {
        month = @"เม.ย.";
    } else if (m == 5) {
        month = @"พ.ค.";
    } else if (m == 6) {
        month = @"มิ.ย.";
    } else if (m == 7) {
        month = @"ก.ค.";
    } else if (m == 8) {
        month = @"ส.ค.";
    } else if (m == 9) {
        month = @"ก.ย.";
    } else if (m == 10) {
        month = @"ต.ค.";
    } else if (m == 11) {
        month = @"พ.ย.";
    } else if (m == 12) {
        month = @"ธ.ค.";
    }
    
    return [NSString stringWithFormat:@"%@ %@ %@", split[2], month, split[0]];
}

- (NSString *)parseTime:(NSString *)time
{
    NSArray *split = [time componentsSeparatedByString:@" "];
//    NSArray *split2 = [split[1] componentsSeparatedByString:@"."];
//    NSInteger h = [split2[0] integerValue];
//    NSInteger m = [split2[1] integerValue];
//    if ([split[0] isEqualToString:@"PM."]) {
//        
//    }
    
    return split[1];
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
    return [DATA count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    
    NSDictionary *dict = DATA[indexPath.row];
    
    [cell configCell:dict];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = DATA[indexPath.row];
    
    [_imageViewEvent setImageWithURL:[NSURL URLWithString:[dict valueForKey:@"image"]]];
    [_labelDate setText:[dict valueForKey:@"dateSt"]];
    [_labelTitle setText:[dict valueForKey:@"title"]];
    
    NSString *detail = [NSString stringWithFormat:@"<html><body>%@</body></html>", [dict valueForKey:@"content"]];
    detail = [detail gtm_stringByUnescapingFromHTML];
    [_webViewDetail loadHTMLString:detail baseURL:nil];
    
    NSString *when = [NSString stringWithFormat:@"%@ %@ - %@ %@", [self parseDate:[dict valueForKey:@"dateSt"]], [self parseTime:[dict valueForKey:@"timeSt"]], [self parseDate:[dict valueForKey:@"dateEd"]], [self parseTime:[dict valueForKey:@"timeEd"]]];
    [_labelWhen setText:when];
    [_labelWhere setText:[dict valueForKey:@"place"]];
    [_labelAudience setText:[dict valueForKey:@"audience"]];
    [_labelSponsor setText:[dict valueForKey:@"sponsor"]];
    [_btnLink setTitle:[[dict valueForKey:@"contact"] valueForKey:@"website"] forState:UIControlStateNormal];
    
    [_scrollViewEvent setHidden:NO];
    
    [Effect slideRightToLeft:_scrollViewEvent duration:0.3 delay:0 completion:^(BOOL finished) {
        [_btnBack setHidden:NO];
    }];
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

# pragma mark - onClick
- (IBAction)onClickBack:(UIButton *)sender
{
    [_btnBack setHidden:YES];
    CGRect frame = [_scrollViewEvent frame];
    [Effect slideLeftToRight:_scrollViewEvent duration:0.3 delay:0 completion:^(BOOL finished) {
        [_scrollViewEvent setHidden:YES];
        [_scrollViewEvent setFrame:frame];
        isShowDetail = NO;
    }];
}
//- (IBAction)onClickRefresh:(UIButton *)sender
//{
//    [self viewDidLoad];
//}
- (IBAction)onClickLink:(UIButton *)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[[sender titleLabel] text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]];
}

@end
