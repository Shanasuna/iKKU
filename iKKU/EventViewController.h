//
//  EventViewController.h
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UITableView *tableViewEvent;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewEvent;
@property (strong, nonatomic) IBOutlet UIView *viewScrollContent;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewEvent;
@property (strong, nonatomic) IBOutlet UILabel *labelDate;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UIWebView *webViewDetail;
@property (strong, nonatomic) IBOutlet UILabel *labelWhen;
@property (strong, nonatomic) IBOutlet UILabel *labelWhere;
@property (strong, nonatomic) IBOutlet UILabel *labelAudience;
@property (strong, nonatomic) IBOutlet UILabel *labelSponsor;
@property (strong, nonatomic) IBOutlet UILabel *labelContact;
@property (strong, nonatomic) IBOutlet UIButton *btnLink;

@end
