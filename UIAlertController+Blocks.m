//
//  UIAlertController+Blocks.m
//  UIAlertControllerBlocks
//
//  Created by Eric Herrmann on 12/3/14.
//  Copyright (c) 2014 Eric Herrmann. All rights reserved.
//

#import "UIAlertController+Blocks.h"

@implementation UIAlertController (Blocks)

+ (instancetype)showInViewController:(UIViewController *)viewController
                           withTitle:(NSString *)title
                             message:(NSString *)message
                      preferredStyle:(UIAlertControllerStyle)preferredStyle
                    cancelButtonItem:(NSString *)cancelButtonItem
               destructiveButtonItem:(NSString *)destructiveButtonItem
                    otherButtonItems:(NSArray *)otherButtonItems
{
    UIAlertController *controller = [self alertControllerWithTitle:title
                                                           message:message
                                                    preferredStyle:preferredStyle];
    
    if (cancelButtonItem) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonItem.label
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (cancelButtonItem.action) {
                                                                     cancelButtonItem.action();
                                                                 }
                                                             }];
        [controller addAction:cancelAction];
    }
    
    if (destructiveButtonItem) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonItem.label
                                                                    style:UIAlertActionStyleDestructive
                                                                  handler:^(UIAlertAction *action){
                                                                      if (destructiveButtonItem.action) {
                                                                          destructiveButtonItem.action();
                                                                      }
                                                                  }];
        [controller addAction:destructiveAction];
    }
    
    for (NSUInteger i = 0; i < otherButtonItems.count; i++) {
        RIButtonItem *otherButtonItem = otherButtonItems[i];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonItem.label
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                                if (otherButtonItem.action) {
                                                                    otherButtonItem.action();
                                                                }
                                                            }];
        [controller addAction:otherAction];
    }
    
    [viewController presentViewController:controller animated:YES completion:nil];
    
    return controller;
}

+ (instancetype)showAlertInViewController:(UIViewController *)viewController
                                withTitle:(NSString *)title
                                  message:(NSString *)message
                         cancelButtonItem:(NSString *)cancelButtonItem
                    destructiveButtonItem:(NSString *)destructiveButtonItem
                         otherButtonItems:(NSArray *)otherButtonItems
{
    return [self showInViewController:viewController
                            withTitle:title
                              message:message
                       preferredStyle:UIAlertControllerStyleAlert
                    cancelButtonItem:cancelButtonItem
               destructiveButtonItem:destructiveButtonItem
                    otherButtonItems:otherButtonItems
            ];
}

+ (instancetype)showActionSheetInViewController:(UIViewController *)viewController
                                      withTitle:(NSString *)title
                                        message:(NSString *)message
                               cancelButtonItem:(NSString *)cancelButtonItem
                          destructiveButtonItem:(NSString *)destructiveButtonItem
                               otherButtonItems:(NSArray *)otherButtonItems
{
    return [self showInViewController:viewController
                            withTitle:title
                              message:message
                       preferredStyle:UIAlertControllerStyleActionSheet
                     cancelButtonItem:cancelButtonItem
                destructiveButtonItem:destructiveButtonItem
                     otherButtonItems:otherButtonItems
            ];

}

@end
