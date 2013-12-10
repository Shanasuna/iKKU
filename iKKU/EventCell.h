//
//  EventCell.h
//  iKKU
//
//  Created by Warakorn9z on 12/8/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageViewEvent;
@property (strong, nonatomic) IBOutlet UILabel *labelDate;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;

- (void)configCell:(NSDictionary *)dict;

@end
