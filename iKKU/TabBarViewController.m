//
//  TabBarViewController.m
//  iKKU
//
//  Created by Warakorn9z on 2/20/2557 BE.
//  Copyright (c) 2557 Zenin. All rights reserved.
//

#import "TabBarViewController.h"
#import "Z9Effect.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
{
    UIImageView *imgSplashScreen;
}

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
    
    [[UITabBar appearance] setTintColor:[Z9Effect colorWithHex:@"#a53b21"]];
    
    imgSplashScreen = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imgSplashScreen setContentMode:UIViewContentModeScaleAspectFill];
    [imgSplashScreen setImage:[UIImage imageNamed:@"splash_ipad"]];
    
    [self.view addSubview:imgSplashScreen];
    
    [self performSelector:@selector(dismissSplashScreen) withObject:nil afterDelay:1.5f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissSplashScreen
{
    [Z9Effect fadeOut:imgSplashScreen duration:1.5 delay:0 completion:^(BOOL finished) {
        [imgSplashScreen removeFromSuperview];
    }];
}

@end
