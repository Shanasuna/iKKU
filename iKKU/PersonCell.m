//
//  PersonCell.m
//  iKKU
//
//  Created by Warakorn9z on 11/29/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "PersonCell.h"

@implementation PersonCell

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

- (void)prepareForReuse
{
    [_imgPerson setImage:nil];
}

- (void)configCell:(NSDictionary *)dict
{
    NSOperationQueue *queue = [NSOperationQueue new];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(loadImage:)
                                                                              object:[dict valueForKey:@"pic"]];
    [queue addOperation:operation];
    
    [_labelName setText:[dict valueForKey:@"name"]];
    [_labelPosition setText:[dict valueForKey:@"ename"]];
    [_labelDepartment setText:[dict valueForKey:@"faculty"]];
    [_labelEmail setText:[dict valueForKey:@"email"]];
}

- (void)loadImage:(NSString *)url
{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    [self performSelectorOnMainThread:@selector(setImage:) withObject:data waitUntilDone:YES];
}

- (void)setImage:(NSData *)data
{
    [_imgPerson setImage:[UIImage imageWithData:data]];
}

@end
