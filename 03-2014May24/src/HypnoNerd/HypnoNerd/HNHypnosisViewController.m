//
//  HNHypnosisViewController.m
//  HypnoNerd
//
//  Created by metodowhite on 24/05/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "HNHypnosisViewController.h"
#import "HPHypnosisView.h"

@implementation HNHypnosisViewController

- (void)loadView {
    
    HPHypnosisView *backgroundView = [[HPHypnosisView alloc] init];
    self.view = backgroundView;
}

@end
