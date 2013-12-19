//
//  ChannelViewController.h
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webViewChannel;
@property (strong, nonatomic) IBOutlet UITableView *tableViewYoutube;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;

- (void)stopVideo;

@end
