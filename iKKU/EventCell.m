//
//  EventCell.m
//  iKKU
//
//  Created by Warakorn9z on 12/8/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "EventCell.h"
#import "UIImageView+AFNetworking.h"

@implementation EventCell

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
    [_imageViewEvent setImageWithURL:[NSURL URLWithString:[dict valueForKey:@"image"]]];
    [_labelDate setText:[dict valueForKey:@"dateSt"]];
    [_labelTitle setText:[dict valueForKey:@"title"]];
}

@end
