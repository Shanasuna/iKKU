//
//  EventDetailViewController.h
//  iKKU
//
//  Created by Warakorn9z on 1/23/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewEventDetail;
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

@property (strong, nonatomic) NSDictionary *Event;

@end
