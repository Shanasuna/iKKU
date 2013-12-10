//
//  NewsViewController.h
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UITableView *tableViewNews;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewDetail;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewNews;
@property (strong, nonatomic) IBOutlet UILabel *labelDate;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UIWebView *webViewDetail;

@end
