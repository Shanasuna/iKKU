//
//  Z9Effect.m
//  iService
//
//  Created by Warakorn9z on 6/17/56 BE.
//  Copyright (c) 2556 FOO. All rights reserved.
//

#import "Z9Effect.h"

@implementation Z9Effect

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

+ (void)slideUp:(UIView *)view
          point:(CGFloat)point
       duration:(double)duration
          delay:(double)delay
     completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x, view.center.y - point)];
                     } completion:completionBlock];
}

+ (void)slideDown:(UIView *)view
            point:(CGFloat)point
         duration:(double)duration
            delay:(double)delay
       completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x, view.center.y + point)];
                     } completion:completionBlock];
}

+ (void)slideLeft:(UIView *)view
            point:(CGFloat)point
         duration:(double)duration
            delay:(double)delay
       completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x - point, view.center.y)];
                     } completion:completionBlock];
}

+ (void)slideRight:(UIView *)view
             point:(CGFloat)point
          duration:(double)duration
             delay:(double)delay
        completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x + point, view.center.y)];
                     } completion:completionBlock];
}

+ (void)slideLeft:(UIView *)view
            point:(CGFloat)point
         duration:(double)duration
            delay:(double)delay
           option:(UIViewAnimationOptions)option
       completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x - point, view.center.y)];
                     } completion:completionBlock];
}

+ (void)slideRight:(UIView *)view
             point:(CGFloat)point
          duration:(double)duration
             delay:(double)delay
            option:(UIViewAnimationOptions)option
        completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:option
                     animations:^{
                         [view setCenter:CGPointMake(view.center.x + point, view.center.y)];
                     } completion:completionBlock];
}

+ (void)bounceViewUp:(UIView *)view
                 point:(CGFloat)point
              duration:(double)duration
{
    NSValue *from = [NSNumber numberWithFloat:view.layer.position.y];
    NSValue *to = [NSNumber numberWithFloat:view.layer.position.y - point];
    NSString *keypath = @"position.y";
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keypath];
    [animation setFromValue:from];
    [animation setToValue:to];
    [animation setDuration:duration];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.8 :.8 :0.8]];
    
    [view.layer addAnimation:animation forKey:@"bounce"];
    [view.layer setValue:to forKeyPath:keypath];
}

+ (void)bounceViewDown:(UIView *)view
                 point:(CGFloat)point
              duration:(double)duration
{
    NSValue *from = [NSNumber numberWithFloat:view.layer.position.y];
    NSValue *to = [NSNumber numberWithFloat:view.layer.position.y + point];
    NSString *keypath = @"position.y";
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keypath];
    [animation setFromValue:from];
    [animation setToValue:to];
    [animation setDuration:duration];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.8 :.8 :0.8]];
    
    [view.layer addAnimation:animation forKey:@"bounce"];
    [view.layer setValue:to forKeyPath:keypath];
}

+ (void)bounceViewLeft:(UIView *)view
                 point:(CGFloat)point
              duration:(double)duration
{
    NSValue *from = [NSNumber numberWithFloat:view.layer.position.x];
    NSValue *to = [NSNumber numberWithFloat:view.layer.position.x - point];
    NSString *keypath = @"position.x";
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keypath];
    [animation setFromValue:from];
    [animation setToValue:to];
    [animation setDuration:duration];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.8 :.8 :0.8]];
    
    [view.layer addAnimation:animation forKey:@"bounce"];
    [view.layer setValue:to forKeyPath:keypath];
}

+ (void)bounceViewRight:(UIView *)view
                  point:(CGFloat)point
               duration:(double)duration
{
    NSValue *from = [NSNumber numberWithFloat:view.layer.position.x];
    NSValue *to = [NSNumber numberWithFloat:view.layer.position.x + point];
    NSString *keypath = @"position.x";
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keypath];
    [animation setFromValue:from];
    [animation setToValue:to];
    [animation setDuration:duration];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.8 :.8 :0.8]];
    
    [view.layer addAnimation:animation forKey:@"bounce"];
    [view.layer setValue:to forKeyPath:keypath];
}

+ (void)fadeIn:(UIView *)view
      duration:(double)duration
         delay:(double)delay
         alpha:(CGFloat)alpha
    completion:(void (^)(BOOL finished))completionBlock
{
    [view setAlpha:0];
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setAlpha:alpha];
                     } completion:completionBlock];
}
+ (void)fadeOut:(UIView *)view
       duration:(double)duration
          delay:(double)delay
     completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [view setAlpha:0];
                     } completion:completionBlock];
}
+ (void)scaleAndfadeIn:(UIView *)view
              duration:(double)duration
                 delay:(double)delay
                 scale:(CGFloat)scale
                 alpha:(CGFloat)alpha
            completion:(void (^)(BOOL finished))completionBlock
{
    [view setAlpha:0];
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         view.transform = CGAffineTransformMakeScale(scale, scale);
                         [view setAlpha:alpha];
                     } completion:completionBlock];
}
+ (void)scaleAndfadeOut:(UIView *)view
               duration:(double)duration
                  delay:(double)delay
                  scale:(CGFloat)scale
             completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         view.center = view.superview.center;
                         view.transform = CGAffineTransformMakeScale(scale, scale);
                         [view setAlpha:0];
                         view.center = view.superview.center;
                     } completion:completionBlock];
}
+ (void)scale:(UIView *)view
     duration:(double)duration
        delay:(double)delay
        scale:(CGFloat)scale
   completion:(void (^)(BOOL finished))completionBlock
{
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         view.transform = CGAffineTransformScale(view.transform, scale, scale);
                     } completion:completionBlock];
}

@end
