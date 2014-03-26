//
//  YouTubePlayerViewController.m
//  iKKU
//
//  Created by Warakorn9z on 1/23/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import "YouTubePlayerViewController.h"

@interface YouTubePlayerViewController ()

@end

@implementation YouTubePlayerViewController

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
    
    if ([_YouTubeURL valueForKey:@"kku_live"] == [NSNull null] || [_YouTubeURL valueForKey:@"kku_live"] == nil) {
        NSString *embedHTML = @"<html><head>\
        <meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 320\"/></head>\
        <body style=\"background:#000;margin-top:0px;margin-left:0px\">\
        <iframe id=\"ytplayer\" type=\"text/html\" width=\"%0.0f\" height=\"%0.0f\"\
        src=\"http://www.youtube.com/embed/%@?autoplay=1\"\
        frameborder=\"0\"/>\
        </body></html>";
        NSString *videoID = [[_YouTubeURL valueForKey:@"id"] valueForKey:@"videoId"];
        NSString* html = [NSString stringWithFormat:embedHTML, _webViewChannel.frame.size.width, _webViewChannel.frame.size.height, videoID];
        
        [_webViewChannel setAllowsInlineMediaPlayback:YES];
        [_webViewChannel loadHTMLString:html baseURL:[NSURL URLWithString:@"http://www.youtube.com"]];
    } else {
        [_webViewChannel setAllowsInlineMediaPlayback:YES];
        [_webViewChannel loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[_YouTubeURL valueForKey:@"kku_live"]]]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stopVideo
{
    [_webViewChannel loadHTMLString:nil baseURL:nil];
    [_webViewChannel setHidden:YES];
}

@end
