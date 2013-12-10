//
//  Effect.h
//  iService
//
//  Created by Warakorn9z on 6/17/56 BE.
//  Copyright (c) 2556 FOO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "API.h"

@interface Effect : NSObject

+ (UIColor *)colorWithHex:(NSString *)hex;
+ (void)toggleMainMenuOn:(UIView *)view duration:(double)duration;
+ (void)toggleMainMenuOff:(UIView *)view duration:(double)duration;
+ (void)toggleMainMenuBTNOn:(UIView *)view duration:(double)duration;
+ (void)toggleMainMenuBTNOff:(UIView *)view duration:(double)duration;
+ (void)toggleTopBarOn:(UIView *)view duration:(double)duration;
+ (void)toggleTopBarOff:(UIView *)view duration:(double)duration;
+ (void)slideLeftToRightAndRemove:(UIView *)view duration:(double)duration;
+ (void)slideLeftToRightAndRemoveRefreshHome:(UIView *)view duration:(double)duration;
+ (void)slideDown:(UIView *)view point:(CGFloat)point duration:(double)duration;
+ (void)slideUp:(UIView *)view point:(CGFloat)point duration:(double)duration;
+ (void)slideUpAndRemove:(UIView *)view point:(CGFloat)point duration:(double)duration;
+ (void)expandView:(UIView *)view duration:(double)duration;
+ (void)collapseViewAndRemove:(UIView *)view duration:(double)duration;
+ (void)slideLeftToRight:(UIView *)view duration:(double)duration delay:(double)delay completion:(void (^)(BOOL finished))completionBlock;
+ (void)slideRightToLeft:(UIView *)view duration:(double)duration delay:(double)delay completion:(void (^)(BOOL finished))completionBlock;

@end
