//
//  HPDetailViewController.h
//  Homepwner
//
//  Created by metodowhite on 07/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MWItem;

@interface HPDetailViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPopoverControllerDelegate>

@property (nonatomic, strong) MWItem *item;

@property (nonatomic, copy) void (^dismissBLock)(void);

- (instancetype)initForNewItem:(BOOL)isNew;
//un segundo
@end
