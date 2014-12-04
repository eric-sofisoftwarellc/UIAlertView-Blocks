//
//  SSUniversalAlert.h
//  SSUniversalAlert
//
//  Created by Eric Herrmann on 12/3/14.
//  Copyright (c) 2014 Eric Herrmann. All rights reserved.
//

// WTF IS THIS?
//
// A project I'm working on uses UIAlertView-Blocks (https://github.com/jivadevoe/UIAlertView-Blocks).
// UIAlertView is now deprecated (as of iOS 8)
// In iOS 8 there is the newer API UIAlertController. I looked around and there is a nice API
// https://github.com/ryanmaxwell/RMUniversalAlert.
// But that conflicts with the existing code using UIAlertView-Blocks.
// So the solution is to reimplement the essential concept of RMUniversalAlert but using UIAlertView-Blocks.

#import "RIButtonItem.h"

@interface SSUniversalAlert : NSObject

+ (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
                 cancelButtonItem:(RIButtonItem *)cancelButtonItem
            destructiveButtonItem:(RIButtonItem *)destructiveButtonItem
                 otherButtonItems:(NSArray *)otherButtonItems;

+ (void)showActionSheetInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonItem:(RIButtonItem *)cancelButtonItem
                 destructiveButtonItem:(RIButtonItem *)destructiveButtonItem
                      otherButtonItems:(NSArray *)otherButtonItems
                          dismissBlock:(void (^)())dismissBlock;

@end
