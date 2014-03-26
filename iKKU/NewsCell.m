//
//  NewsCell.m
//  iKKU
//
//  Created by Warakorn9z on 12/7/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+AFNetworking.h"

#define URL_RESIZE_IMG @"https://www.kku.ac.th/ikku/api/images/image.php?width=150&height=150&image="

@implementation NewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCell:(NSDictionary *)dict
{
    [_imageViewNews setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", URL_RESIZE_IMG, [dict valueForKey:@"pictitle"]]]];
//    NSLog(@"URL: %@", [NSString stringWithFormat:@"%@%@", URL_RESIZE_IMG, [dict valueForKey:@"pictitle"]]);
    [_labelTitle setText:[dict valueForKey:@"title"]];
}

@end
