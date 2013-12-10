//
//  PlaceViewController.m
//  iKKU
//
//  Created by Warakorn9z on 11/28/2556 BE.
//  Copyright (c) 2556 Zenin. All rights reserved.
//

#import "PlaceViewController.h"
#import "API.h"

#define TYPE_FOOD 1
#define TYPE_COFFEE 2
#define TYPE_MEETING 3
#define TYPE_LIBRARY 4
#define TYPE_HOTEL 5
#define TYPE_ATM 6
#define TYPE_PARKING 7
#define TYPE_TOILET 8
#define TYPE_BUS 10

@interface PlaceViewController () <APIDelegate, GMSMapViewDelegate>

@end

@implementation PlaceViewController
{
    API *api;
    NSArray *DATA;
    NSInteger TYPE;
    UIImage *pinMe, *pinFood, *pinCoffee, *pinMeeting, *pinLibrary, *pinHotel, *pinATM, *pinParking, *pinToilet, *pinBus;
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
    
    api = [API new];
    [api setDelegate:self];
    
    _locationManager = [CLLocationManager new];
    [_locationManager setDistanceFilter:kCLDistanceFilterNone];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager startUpdatingLocation];
    
    pinMe = [UIImage imageNamed:@"ic_pin_me.png"];
    pinFood = [UIImage imageNamed:@"ic_pin_restaurant.png"];
    pinCoffee = [UIImage imageNamed:@"ic_pin_coffee.png"];
    pinMeeting = [UIImage imageNamed:@"ic_pin_meeting.png"];
    pinLibrary = [UIImage imageNamed:@"ic_pin_library.png"];
    pinHotel = [UIImage imageNamed:@"ic_pin_hotel.png"];
    pinATM = [UIImage imageNamed:@"ic_pin_atm.png"];
    pinParking = [UIImage imageNamed:@"ic_pin_parking.png"];
    pinToilet = [UIImage imageNamed:@"ic_pin_toilet.png"];
    pinBus = [UIImage imageNamed:@"ic_pin_bus.png"];
    
    [_btnFood setTag:TYPE_FOOD];
    [_btnCoffee setTag:TYPE_COFFEE];
    [_btnMeeting setTag:TYPE_MEETING];
    [_btnLibrary setTag:TYPE_LIBRARY];
    [_btnHotel setTag:TYPE_HOTEL];
    [_btnATM setTag:TYPE_ATM];
    [_btnParking setTag:TYPE_PARKING];
    [_btnToilet setTag:TYPE_TOILET];
    [_btnBus setTag:TYPE_BUS];
    
    [_btnFood addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnCoffee addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnMeeting addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnLibrary addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnHotel addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnATM addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnParking addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnToilet addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    [_btnBus addTarget:self action:@selector(onClickType:) forControlEvents:UIControlEventTouchUpInside];
    
    _gmsMap = [[GMSMapView alloc] initWithFrame:_viewMapZone.frame];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:[[_locationManager location] coordinate] zoom:14];
    [_gmsMap setCamera:camera];
    [_gmsMap setMyLocationEnabled:YES];
    [_gmsMap setMapType:kGMSTypeHybrid];
    [self.view addSubview:_gmsMap];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
//    [marker setPosition:CLLocationCoordinate2DMake(16.472402, 102.82551)];
    [marker setPosition:[[_locationManager location] coordinate]];
    [marker setTitle:@"Current Location"];
    [marker setIcon:pinMe];
    [marker setMap:_gmsMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickType:(UIButton *)sender {
    [_gmsMap clear];
    TYPE = [sender tag];
    [api getLocationWithType:TYPE];
}
- (IBAction)onClickRefresh:(UIButton *)sender {
    [self viewDidLoad];
}

- (void)getLocationWithTypeCompleted:(NSObject *)result {
    DATA = [result valueForKey:@"result"];
    NSLog(@"Result : %@", result);
    
    GMSMarker *marker = [[GMSMarker alloc] init];
//    [marker setPosition:CLLocationCoordinate2DMake(16.472402, 102.82551)];
    [marker setPosition:[[_locationManager location] coordinate]];
    [marker setTitle:@"Current Location"];
    [marker setIcon:pinMe];
    [marker setMap:_gmsMap];
    
    for (NSDictionary *dict in DATA) {
        GMSMarker *marker = [[GMSMarker alloc] init];
        [marker setPosition:CLLocationCoordinate2DMake([[dict valueForKey:@"lat"] doubleValue], [[dict valueForKey:@"lon"] doubleValue])];
        [marker setTitle:[dict valueForKey:@"name"]];
        [marker setIcon:[self getPin]];
        [marker setMap:_gmsMap];
    }
}

- (UIImage *)getPin
{
    switch (TYPE) {
        case TYPE_FOOD:
            return pinFood;
        case TYPE_COFFEE:
            return pinCoffee;
        case TYPE_MEETING:
            return pinMeeting;
        case TYPE_LIBRARY:
            return pinLibrary;
        case TYPE_HOTEL:
            return pinHotel;
        case TYPE_ATM:
            return pinATM;
        case TYPE_PARKING:
            return pinParking;
        case TYPE_TOILET:
            return pinToilet;
        case TYPE_BUS:
            return pinBus;
        default:
            break;
    }
    return nil;
}

@end
