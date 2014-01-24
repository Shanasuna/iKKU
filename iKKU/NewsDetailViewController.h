//
//  NewDetailViewController.h
//  iKKU
//
//  Created by Warakorn9z on 1/20/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgNewsPic;
@property (strong, nonatomic) IBOutlet UILabel *labelDate;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UIWebView *webViewDetail;

@property (strong, nonatomic) NSDictionary *News;

@end