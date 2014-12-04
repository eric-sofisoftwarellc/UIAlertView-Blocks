//
//  SSUniversalAlert.m
//  SSUniversalAlert
//
//  Created by Eric Herrmann on 12/3/14.
//  Copyright (c) 2014 Eric Herrmann. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import "UIActionSheet+Blocks.h"

#import "SSUniversalAlert.h"

@implementation SSUniversalAlert

+ (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
                 cancelButtonItem:(RIButtonItem *)cancelButtonItem
            destructiveButtonItem:(RIButtonItem *)destructiveButtonItem
                 otherButtonItems:(NSArray *)otherButtonItems
{
    if ([UIAlertController class]) {
        [UIAlertController showAlertInViewController:viewController
                                          withTitle:title message:message
                                  cancelButtonItem:cancelButtonItem
                             destructiveButtonItem:destructiveButtonItem
                                  otherButtonItems:otherButtonItems
         ];
    } else {
        NSMutableArray *other = [NSMutableArray array];
        
        if (destructiveButtonItem) {
            [other addObject:destructiveButtonItem];
        }
        
        if (otherButtonItems) {
            [other addObjectsFromArray:otherButtonItems];
        }
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title
                                                         message:message
                                                cancelButtonItem:cancelButtonItem
                                                otherButtonItems:destructiveButtonItem, nil
                               ];
        for (RIButtonItem * item in otherButtonItems) {
            [alert addButtonItem:item];
        }
        
        [alert show];
    }
}

+ (void)showActionSheetInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                                message:(NSString *)message
                       cancelButtonItem:(RIButtonItem *)cancelButtonItem
                  destructiveButtonItem:(RIButtonItem *)destructiveButtonItem
                       otherButtonItems:(NSArray *)otherButtonItems
                           dismissBlock:(void (^)())dismissBlock
{
    if ([UIAlertController class]) {
        [UIAlertController showActionSheetInViewController:viewController
                                                 withTitle:title
                                                   message:message
                                         cancelButtonItem:cancelButtonItem
                                    destructiveButtonItem:destructiveButtonItem
                                         otherButtonItems:otherButtonItems
        ];
    } else {
        UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:title
                                                    cancelButtonItem:cancelButtonItem
                                               destructiveButtonItem:destructiveButtonItem
                                                    otherButtonItems:nil];
        
        for (RIButtonItem * item in otherButtonItems) {
            [sheet addButtonItem:item];
        }
        
        sheet.dismissalAction = dismissBlock;
        
        [sheet show];
    }
}

@end
