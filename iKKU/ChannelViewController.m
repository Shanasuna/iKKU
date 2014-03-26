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
#import "YouTubePlayerViewController.h"

#define LIVE_URL @"http://www.kku.ac.th/kkuchannel/internet-iphone.php"
#define LIVE_PIC_URL @"http://www.kku.ac.th/kkuchannel/internet-iphone.php"
#define LIVE_TITLE @"Live Channel"
#define LIVE_DESCRIPTION @"KKU Live Channel"

@interface ChannelViewController () <APIDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation ChannelViewController
{
    API *api;
    UIRefreshControl *refresh;
    NSMutableArray *DATA;
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
    
    api = [API new];
    [api setDelegate:self];
    [API showLoading];
    [api getYoutubeList];
    
    [_tableViewYoutube setDataSource:self];
    [_tableViewYoutube setDelegate:self];
    
    refresh = [UIRefreshControl new];
    [refresh addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    UITableViewController *tvc = [UITableViewController new];
    [tvc setTableView:_tableViewYoutube];
    [tvc setRefreshControl:refresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSLog(@"Channel Memory Warning");
}

# pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    YouTubePlayerViewController *dest = [segue destinationViewController];
    [dest setYouTubeURL:sender];
}

- (void)onRefresh
{
    [api getYoutubeList];
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
    NSDictionary *dict = DATA[indexPath.row];
    [self performSegueWithIdentifier:@"YouTubePlayer" sender:dict];
}

- (void)getYoutubeListCompleted:(NSObject *)result
{
    DATA = [NSMutableArray arrayWithArray:[result valueForKey:@"items"]];
    
    NSDictionary *live = @{
                           @"snippet" : @{
                                            @"thumbnails" : @{ @"default" : @{ @"url": LIVE_PIC_URL } },
                                            @"title" : LIVE_TITLE,
                                            @"description" : LIVE_DESCRIPTION
                                            },
                           @"kku_live" : LIVE_URL
                           };
    [DATA insertObject:live atIndex:0];
    
    [refresh endRefreshing];
    [_tableViewYoutube reloadData];
}

@end
