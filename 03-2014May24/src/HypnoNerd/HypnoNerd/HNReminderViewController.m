//
//  HNReminderViewController.m
//  HypnoNerd
//
//  Created by metodowhite on 24/05/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "HNReminderViewController.h"

@interface HNReminderViewController()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation HNReminderViewController

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting Reminder for %@", date);
}

@end
