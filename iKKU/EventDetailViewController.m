//
//  EventDetailViewController.m
//  iKKU
//
//  Created by Warakorn9z on 1/23/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import "EventDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "GTMNSString+HTML.h"

@interface EventDetailViewController () <UIWebViewDelegate>

@end

@implementation EventDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    for (UIView *view in [_scrollViewEventDetail subviews]) {
        [view removeFromSuperview];
    }
    [_scrollViewEventDetail addSubview:_viewScrollContent];
    [_scrollViewEventDetail setContentSize:CGSizeMake(_viewScrollContent.frame.size.width, _viewScrollContent.frame.size.height)];
    
    [_imageViewEvent setImageWithURL:[NSURL URLWithString:[_Event valueForKey:@"image"]]];
    [_labelDate setText:[_Event valueForKey:@"dateSt"]];
    [_labelTitle setText:[_Event valueForKey:@"title"]];
    
    NSString *detail = [NSString stringWithFormat:@"<html><body>%@</body></html>", [_Event valueForKey:@"content"]];
    detail = [detail gtm_stringByUnescapingFromHTML];
    [_webViewDetail loadHTMLString:detail baseURL:nil];
    
    NSString *when = [NSString stringWithFormat:@"%@ %@ - %@ %@", [self parseDate:[_Event valueForKey:@"dateSt"]], [self parseTime:[_Event valueForKey:@"timeSt"]], [self parseDate:[_Event valueForKey:@"dateEd"]], [self parseTime:[_Event valueForKey:@"timeEd"]]];
    [_labelWhen setText:when];
    [_labelWhere setText:[_Event valueForKey:@"place"]];
    [_labelAudience setText:[_Event valueForKey:@"audience"]];
    [_labelSponsor setText:[_Event valueForKey:@"sponsor"]];
    [_labelContact setText:[[_Event valueForKey:@"contact"] valueForKey:@"phone"]];
    [_btnLink setTitle:[[_Event valueForKey:@"contact"] valueForKey:@"website"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)parseDate:(NSString *)date
{
    NSArray *split = [date componentsSeparatedByString:@"-"];
    NSInteger m = [[split objectAtIndex:1] integerValue];
    NSString *month;
    
    if (m == 1) {
        month = @"ม.ค.";
    } else if (m == 2) {
        month = @"ก.พ.";
    } else if (m == 3) {
        month = @"มี.ค.";
    } else if (m == 4) {
        month = @"เม.ย.";
    } else if (m == 5) {
        month = @"พ.ค.";
    } else if (m == 6) {
        month = @"มิ.ย.";
    } else if (m == 7) {
        month = @"ก.ค.";
    } else if (m == 8) {
        month = @"ส.ค.";
    } else if (m == 9) {
        month = @"ก.ย.";
    } else if (m == 10) {
        month = @"ต.ค.";
    } else if (m == 11) {
        month = @"พ.ย.";
    } else if (m == 12) {
        month = @"ธ.ค.";
    }
    
    return [NSString stringWithFormat:@"%@ %@ %@", split[2], month, split[0]];
}

- (NSString *)parseTime:(NSString *)time
{
    NSArray *split = [time componentsSeparatedByString:@" "];
    //    NSArray *split2 = [split[1] componentsSeparatedByString:@"."];
    //    NSInteger h = [split2[0] integerValue];
    //    NSInteger m = [split2[1] integerValue];
    //    if ([split[0] isEqualToString:@"PM."]) {
    //
    //    }
    
    return split[1];
}

# pragma mark - onClick
- (IBAction)onClickLink:(UIButton *)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[[sender titleLabel] text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]];
}

@end
