//
//  NewsCell.h
//  iKKU
//
//  Created by Warakorn9z on 12/7/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageViewNews;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;

- (void)configCell:(NSDictionary *)dict;

@end
