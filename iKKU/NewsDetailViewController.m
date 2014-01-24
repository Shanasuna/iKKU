//
//  NewDetailViewController.m
//  iKKU
//
//  Created by Warakorn9z on 1/20/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "GTMNSString+HTML.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

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
    
    [self.navigationItem setTitle:[_News valueForKey:@"title"]];
    
    [_imgNewsPic setImageWithURL:[NSURL URLWithString:[[_News valueForKey:@"picnewsUrl"] objectAtIndex:0]]];
    [_labelDate setText:[_News valueForKey:@"date"]];
    [_labelTitle setText:[_News valueForKey:@"title"]];
    
    NSString *detail = [NSString stringWithFormat:@"<html><body>%@</body></html>", [_News valueForKey:@"detail"]];
    detail = [detail gtm_stringByUnescapingFromHTML];
    [_webViewDetail loadHTMLString:detail baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
