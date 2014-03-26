//
//  NewDetailViewController.h
//  iKKU
//
//  Created by Warakorn9z on 1/20/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgNewsPic;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIWebView *webViewDetail;

@property (strong, nonatomic) NSDictionary *News;

@end