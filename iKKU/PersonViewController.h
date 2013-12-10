//
//  PersonViewController.h
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldType;
@property (weak, nonatomic) IBOutlet UITextField *textFieldKeyword;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITableView *tableViewPerson;
@property (weak, nonatomic) IBOutlet UILabel *labelNotFound;

@end
