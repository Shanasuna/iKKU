//
//  ChannelViewController.m
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "ChannelViewController.h"
#import "YoutubeCell.h"
#import "API.h"
#import "UIImageView+AFNetworking.h"
#import <MediaPlayer/MPMoviePlayerController.h>

#define URL @"http://202.12.97.4/kkuchannel/intranet-iphone.php"

@interface ChannelViewController () <APIDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation ChannelViewController
{
    API *api;
    NSArray *DATA;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    [_webViewChannel setScalesPageToFit:YES];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
//    [_webViewChannel loadRequest:request];
    
    api = [API new];
    [api setDelegate:self];
    [api getYoutubeList];
    
    [_tableViewYoutube setDataSource:self];
    [_tableViewYoutube setDelegate:self];
    
    [_tableViewYoutube setHidden:NO];
    [_webViewChannel setHidden:YES];
    [_btnBack setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self onClickBack:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [DATA count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YoutubeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YoutubeCell" forIndexPath:indexPath];
    
    NSDictionary *dict = [DATA[indexPath.row] valueForKey:@"snippet"];
    
    NSURL *url = [NSURL URLWithString:[[[dict valueForKey:@"thumbnails"] valueForKey:@"default"] valueForKey:@"url"]];
    [cell.imageViewVideo setImageWithURL:url];
    [cell.labelTitle setText:[dict valueForKey:@"title"]];
    [cell.labelDescription setText:[dict valueForKey:@"description"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Clicked");
    NSDictionary *dict = DATA[indexPath.row];
    
    NSString *embedHTML = @"<html><head>\
    <meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 320\"/></head>\
    <body style=\"background:#000;margin-top:0px;margin-left:0px\">\
    <iframe id=\"ytplayer\" type=\"text/html\" width=\"%0.0f\" height=\"%0.0f\"\
    src=\"http://www.youtube.com/embed/%@?autoplay=1\"\
    frameborder=\"0\"/>\
    </body></html>";
    NSString *videoID = [[dict valueForKey:@"id"] valueForKey:@"videoId"];
    NSString* html = [NSString stringWithFormat:embedHTML, _webViewChannel.frame.size.width, _webViewChannel.frame.size.height, videoID];
    
    NSLog(@"html: %@", html);
    
    [_tableViewYoutube setHidden:YES];
    [_webViewChannel setHidden:NO];
    [_webViewChannel setAllowsInlineMediaPlayback:YES];
    [_webViewChannel loadHTMLString:html baseURL:[NSURL URLWithString:@"http://www.youtube.com"]];
    [_btnBack setHidden:NO];
}

- (void)getYoutubeListCompleted:(NSObject *)result
{
    DATA = [result valueForKey:@"items"];
    [_tableViewYoutube reloadData];
}

- (IBAction)onClickBack:(UIButton *)sender
{
    [_webViewChannel loadHTMLString:nil baseURL:nil];
    [_webViewChannel setHidden:YES];
    [_btnBack setHidden:YES];
    [_tableViewYoutube setHidden:NO];
}

- (IBAction)onClickRefresh:(UIButton *)sender {
    [self viewDidLoad];
}

@end
