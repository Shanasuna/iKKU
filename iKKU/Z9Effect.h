//
//  Z9Effect.h
//  iService
//
//  Created by Warakorn9z on 6/17/56 BE.
//  Copyright (c) 2556 FOO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Z9Effect : NSObject

+ (UIColor *)colorWithHex:(NSString *)hex;
+ (void)slideUp:(UIView *)view
          point:(CGFloat)point
       duration:(double)duration
          delay:(double)delay
     completion:(void (^)(BOOL finished))completionBlock;
+ (void)slideDown:(UIView *)view
            point:(CGFloat)point
         duration:(double)duration
            delay:(double)delay
       completion:(void (^)(BOOL finished))completionBlock;
+ (void)slideLeft:(UIView *)view
            point:(CGFloat)point
         duration:(double)duration
            delay:(double)delay
       completion:(void (^)(BOOL finished))completionBlock;
+ (void)slideRight:(UIView *)view
            point:(CGFloat)point
         duration:(double)duration
            delay:(double)delay
       completion:(void (^)(BOOL finished))completionBlock;
+ (void)slideLeft:(UIView *)view
            point:(CGFloat)point
         duration:(double)duration
            delay:(double)delay
           option:(UIViewAnimationOptions)option
       completion:(void (^)(BOOL finished))completionBlock;
+ (void)slideRight:(UIView *)view
             point:(CGFloat)point
          duration:(double)duration
             delay:(double)delay
            option:(UIViewAnimationOptions)option
        completion:(void (^)(BOOL finished))completionBlock;
+ (void)bounceViewUp:(UIView *)view
               point:(CGFloat)point
            duration:(double)duration;
+ (void)bounceViewDown:(UIView *)view
                 point:(CGFloat)point
              duration:(double)duration;
+ (void)bounceViewLeft:(UIView *)view
                 point:(CGFloat)point
              duration:(double)duration;
+ (void)bounceViewRight:(UIView *)view
                 point:(CGFloat)point
              duration:(double)duration;
+ (void)fadeIn:(UIView *)view
      duration:(double)duration
         delay:(double)delay
         alpha:(CGFloat)alpha
    completion:(void (^)(BOOL finished))completionBlock;
+ (void)fadeOut:(UIView *)view
       duration:(double)duration
          delay:(double)delay
     completion:(void (^)(BOOL finished))completionBlock;
+ (void)scaleAndfadeIn:(UIView *)view
              duration:(double)duration
                 delay:(double)delay
                 scale:(CGFloat)scale
                 alpha:(CGFloat)alpha
            completion:(void (^)(BOOL finished))completionBlock;
+ (void)scaleAndfadeOut:(UIView *)view
              duration:(double)duration
                 delay:(double)delay
                 scale:(CGFloat)scale
            completion:(void (^)(BOOL finished))completionBlock;
+ (void)scale:(UIView *)view
     duration:(double)duration
        delay:(double)delay
        scale:(CGFloat)scale
   completion:(void (^)(BOOL finished))completionBlock;

@end
