//
//  PersonCell.h
//  iKKU
//
//  Created by Warakorn9z on 11/29/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgPerson;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelPosition;
@property (strong, nonatomic) IBOutlet UILabel *labelDepartment;
@property (strong, nonatomic) IBOutlet UILabel *labelEmail;

- (void)configCell:(NSDictionary *)dict;

@end
