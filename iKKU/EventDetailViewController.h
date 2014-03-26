//
//  EventDetailViewController.h
//  iKKU
//
//  Created by Warakorn9z on 1/23/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewEventDetail;
@property (weak, nonatomic) IBOutlet UIView *viewScrollContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewEvent;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIWebView *webViewDetail;
@property (weak, nonatomic) IBOutlet UILabel *labelWhen;
@property (weak, nonatomic) IBOutlet UILabel *labelWhere;
@property (weak, nonatomic) IBOutlet UILabel *labelAudience;
@property (weak, nonatomic) IBOutlet UILabel *labelSponsor;
@property (weak, nonatomic) IBOutlet UILabel *labelContact;
@property (weak, nonatomic) IBOutlet UIButton *btnLink;

@property (strong, nonatomic) NSDictionary *Event;

@end
