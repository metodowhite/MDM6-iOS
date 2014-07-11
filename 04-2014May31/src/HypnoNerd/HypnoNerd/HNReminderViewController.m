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

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Reminder";
        
        UIImage *i = [UIImage imageNamed:@"reminder"];
        self.tabBarItem.image = i;
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting Reminder for %@", date);
}

@end

















