//
//  PlaceViewController.h
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface PlaceViewController : UIViewController

@property (strong, nonatomic) GMSMapView *gmsMap;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) IBOutlet UIView *viewExpandBTN;
@property (strong, nonatomic) IBOutlet UIButton *btnToggleViewExpand;
@property (weak, nonatomic) IBOutlet UIButton *btnFood;
@property (weak, nonatomic) IBOutlet UIButton *btnCoffee;
@property (weak, nonatomic) IBOutlet UIButton *btnMeeting;
@property (weak, nonatomic) IBOutlet UIButton *btnLibrary;
@property (weak, nonatomic) IBOutlet UIButton *btnHotel;
@property (weak, nonatomic) IBOutlet UIButton *btnATM;
@property (weak, nonatomic) IBOutlet UIButton *btnParking;
@property (weak, nonatomic) IBOutlet UIButton *btnToilet;
@property (weak, nonatomic) IBOutlet UIButton *btnBus;
@property (weak, nonatomic) IBOutlet UIView *viewMapZone;

@end
