//
//  API.m
//  iService
//
//  Created by Warakorn9z on 6/18/56 BE.
//  Copyright (c) 2556 FOO. All rights reserved.
//

#import "API.h"

#define URL_KKU @"http://www.kku.ac.th/"
#define URL @"https://rdttc.kku.ac.th"
#define YOUTUBE_API_URL @"https://www.googleapis.com/youtube/v3/search"

#define NEWS_MAX_RESULT @"30"

#define YOUTUBE_API_KEY @"AIzaSyC5dFn7qNAb1ZL554iIDSmBCbDs3YpzliE"
#define YOUTUBE_CHANNEL_ID @"UCkIDmK5u76FqpqUaTyH01NQ"
#define MAX_RESULT @"50"
#define ORDER_BY @"date"

static UIAlertView *loading;
static NSString *DeviceToken, *userName;
static BOOL isShowMSGDialog;

@interface API() <UIAlertViewDelegate>

@end

@implementation API

// Delegate Function
- (void)getNewsWithLimit:(NSInteger)limit
{
    
//    [API showLoading];
    
    NSDictionary *params = @{
                             @"limit" : [NSString stringWithFormat:@"%li", (long)limit]
                             };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager GET:[NSString stringWithFormat:@"%@%@", URL_KKU, @"/ikku/api/news/services/topNews.php"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [API dismissLoading];
        [_delegate getNewsCompleted:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [API dismissLoading];
        NSLog(@"Error: %@", error);
        
    }];
}

- (void)getEventWithLimit:(NSInteger)limit
{
    
//    [API showLoading];
    
    NSDictionary *params = @{
                             @"limit" : [NSString stringWithFormat:@"%li", (long)limit]
                             };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager GET:[NSString stringWithFormat:@"%@%@", URL_KKU, @"/ikku/api/activities/services/onshowActivity.php"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [API dismissLoading];
        [_delegate getEventCompleted:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [API dismissLoading];
        NSLog(@"Error: %@", error);
        
    }];
}

- (void)getLocationWithType:(NSInteger)type
{
    
    [API showLoading];
    
    NSDictionary *params = @{
                             @"type" : [NSString stringWithFormat:@"%li", (long)type]
                             };
    
    NSLog(@"Request with Parameter : %@", params);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [manager GET:[NSString stringWithFormat:@"%@%@", URL, @"/itsupport/ikku_android/placekku_api.php"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
        [API dismissLoading];
        [_delegate getLocationWithTypeCompleted:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [API dismissLoading];
        NSLog(@"Error: %@", error);
    }];
}

- (void)searchPersonWith:(NSString *)type
                 keyword:(NSString *)keyword
{
    [API showLoading];
    
    NSDictionary *params = @{
                             @"type" : type,
                             @"q" : keyword
                             };
    
    NSLog(@"Request with Parameter : %@", params);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [manager GET:[NSString stringWithFormat:@"%@%@", URL, @"/itsupport/ikku_android/hrkku_api_new.php"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"JSON: %@", responseObject);
        [API dismissLoading];
        [_delegate searchPersonCompleted:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [API dismissLoading];
        NSLog(@"Error: %@", error);
    }];
}

- (void)getYoutubeList
{
//    [API showLoading];
    
    NSDictionary *params = @{
                             @"part" : @"snippet",
                             @"key" : YOUTUBE_API_KEY,
                             @"maxResults" : MAX_RESULT,
                             @"channelId" : YOUTUBE_CHANNEL_ID,
                             @"order" : ORDER_BY
                             };
    
    NSLog(@"Request with Parameter : %@", params);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager GET:YOUTUBE_API_URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"JSON: %@", responseObject);
        [API dismissLoading];
        [_delegate getYoutubeListCompleted:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [API dismissLoading];
        NSLog(@"Error: %@", error);
    }];
}

// Core Function
+ (void)showLoading
{
    loading = [[UIAlertView alloc] initWithTitle:@"Loading"
                                         message:@"Please Wait ..."
                                        delegate:nil
                               cancelButtonTitle:nil
                               otherButtonTitles:nil];
    [loading show];
}
+ (void)dismissLoading
{
    [loading dismissWithClickedButtonIndex:-9 animated:YES];
}
+ (void)showDialog:(NSString *)msg
{
    if(!isShowMSGDialog) {
        loading = [[UIAlertView alloc] initWithTitle:nil
                                             message:msg
                                            delegate:self
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
        [loading show];
    }
}
+ (void)dismissDialog
{
    
}

+ (void)callNumber:(NSString *)no
{
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", no]]];
    } else {
        [API showDialog:@"Your device doesn't support phone call"];
    }
}

+ (NSString *)MD5:(NSString *)text
{
    // Create pointer to the string as UTF8
    const char *ptr = [text UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    NSLog(@"Dismiss : %d", buttonIndex);
//    if(buttonIndex == -9) {
//        NSLog(@"Check -9");
//    }
//}

@end
