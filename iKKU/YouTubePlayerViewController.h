//
//  YouTubePlayerViewController.h
//  iKKU
//
//  Created by Warakorn9z on 1/23/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YouTubePlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webViewChannel;

@property (strong, nonatomic) NSDictionary *YouTubeURL;

- (void)stopVideo;

@end