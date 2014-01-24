//
//  API.h
//  iService
//
//  Created by Warakorn9z on 6/18/56 BE.
//  Copyright (c) 2556 FOO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "AFNetworking.h"

@class API;

@protocol APIDelegate <NSObject>
@optional
- (void)getNewsCompleted:(NSObject *)result;
- (void)getEventCompleted:(NSObject *)result;
- (void)getLocationWithTypeCompleted:(NSObject *)result;
- (void)searchPersonCompleted:(NSObject *)result;
- (void)getYoutubeListCompleted:(NSObject *)result;

@end

@interface API : NSObject

@property (strong, nonatomic) id<APIDelegate> delegate;
@property (strong, nonatomic) NSDictionary *responseJSON;

//@property (strong, nonatomic) id mainDelegate;

// Delegete Function
- (void)getNewsWithLimit:(NSInteger)limit;
- (void)getEventWithLimit:(NSInteger)limit;
- (void)getLocationWithType:(NSInteger)type;
- (void)searchPersonWith:(NSString *)type
                 keyword:(NSString *)keyword;
- (void)getYoutubeList;

// Core Function

+ (void)showLoading;
+ (void)dismissLoading;
+ (void)showDialog:(NSString *)msg;
+ (void)dismissDialog;
+ (void)callNumber:(NSString *)no;
//+ (void)DeviceToken:(NSString *)token;
//+ (NSString *)DeviceToken;

+ (NSString *)MD5:(NSString *)text;

@end