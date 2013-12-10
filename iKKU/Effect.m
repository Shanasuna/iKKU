//
//  Effect.m
//  iService
//
//  Created by Warakorn9z on 6/17/56 BE.
//  Copyright (c) 2556 FOO. All rights reserved.
//

#import "Effect.h"

@implementation Effect

#pragma mark - Color
+ (UIColor *)colorWithHex:(NSString *)hex
{
    unsigned int c;
    if ([hex characterAtIndex:0] == '#') {
        [[NSScanner scannerWithString:[hex substringFromIndex:1]] scanHexInt:&c];
    } else {
        [[NSScanner scannerWithString:hex] scanHexInt:&c];
    }
    return [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0 green:((c & 0xff00) >> 8)/255.0 blue:(c & 0xff)/255.0 alpha:1.0];
}

+ (void)toggleMainMenuOn:(UIView *)view duration:(double)duration
{
//    [view setFrame:CGRectMake(0, 548, view.frame.size.width, view.frame.size.height)];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         
                     }];
}

+ (void)toggleMainMenuOff:(UIView *)view duration:(double)duration
{
//    [view setFrame:CGRectMake(0, 20, view.frame.size.width, view.frame.size.height)];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(0, 548, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         
                     }];
}

+ (void)toggleMainMenuBTNOn:(UIView *)view duration:(double)duration
{
    //    [view setFrame:CGRectMake(0, 548, view.frame.size.width, view.frame.size.height)];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         
                     }];
}

+ (void)toggleMainMenuBTNOff:(UIView *)view duration:(double)duration
{
    //    [view setFrame:CGRectMake(0, 20, view.frame.size.width, view.frame.size.height)];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(0, 548, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         
                     }];
}

+ (void)toggleTopBarOn:(UIView *)view duration:(double)duration
{
    [view setFrame:CGRectMake(0, -30, view.frame.size.width, view.frame.size.height)];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         
                     }];
}

+ (void)toggleTopBarOff:(UIView *)view duration:(double)duration
{
    [view setFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(0, -30, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         
                     }];
}

+ (void)slideLeftToRightAndRemove:(UIView *)view duration:(double)duration
{
    CGRect frame = view.frame;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(320, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         [view removeFromSuperview];
                         [view setFrame:frame];
                     }];
}

+ (void)slideLeftToRightAndRemoveRefreshHome:(UIView *)view duration:(double)duration
{
    CGRect frame = view.frame;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(320, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                     } completion:^(BOOL finished) {
                         [view removeFromSuperview];
                         [view setFrame:frame];
                     }];
}

+ (void)slideDown:(UIView *)view point:(CGFloat)point duration:(double)duration
{
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x, view.center.y + point)];
                     } completion:^(BOOL finished) {
                         
                     }];
}
+ (void)slideUp:(UIView *)view point:(CGFloat)point duration:(double)duration
{
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x, view.center.y - point)];
                     } completion:^(BOOL finished) {
                         
                     }];
}
+ (void)slideUpAndRemove:(UIView *)view point:(CGFloat)point duration:(double)duration
{
    CGRect frame = view.frame;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x, view.center.y - point)];
                     } completion:^(BOOL finished) {
                         [view removeFromSuperview];
                         [view setFrame:frame];
                     }];
}

+ (void)expandView:(UIView *)view duration:(double)duration
{
    CGRect frame = view.frame;
    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 0)];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:frame];
                     } completion:^(BOOL finished) {

                     }];
}
+ (void)collapseViewAndRemove:(UIView *)view duration:(double)duration
{
    CGRect frame = view.frame;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 0)];
                     } completion:^(BOOL finished) {
                         [view removeFromSuperview];
                         [view setFrame:frame];
                     }];
}


+ (void)slideLeftToRight:(UIView *)view duration:(double)duration delay:(double)delay completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                     } completion:completionBlock];
}
+ (void)slideRightToLeft:(UIView *)view duration:(double)duration delay:(double)delay completion:(void (^)(BOOL finished))completionBlock
{
    CGFloat X = view.frame.origin.x;
    [view setFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setFrame:CGRectMake(X, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                     } completion:completionBlock];
}

@end
