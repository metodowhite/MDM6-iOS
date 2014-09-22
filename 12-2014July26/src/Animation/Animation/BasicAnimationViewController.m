//
//  BasicAnimationViewController.m
//  Animation
//
//  Created by metodowhite on 26/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "BasicAnimationViewController.h"

@interface BasicAnimationViewController ()
@property (nonatomic) UIImageView *myBall;
@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *ballImage = [[UIImage alloc] init];
    ballImage = [UIImage imageNamed:@"ball"];
    self.myBall = [[UIImageView alloc] initWithImage:ballImage];
    
    // [self.myBall setImage:[UIImage imageNamed:@"ball"]];
    
//    self.myBall.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2 - 44.0f,
//                                   100.0f,
//                                   88.0f,
//                                   88.0f);
    self.myBall.frame = CGRectMake(0.0f,
                                   0.0f,
                                   11.0f,
                                   11.0f);
    
    self.myBall.alpha = 0.0f;
    
    [self.view addSubview:_myBall];
    
    [UIView animateWithDuration:3.0f
                     animations:^{
                         self.myBall.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2 - 44.0f,
                                                        CGRectGetHeight(self.view.frame) - 88.0f,
                                                        88.0f,
                                                        88.0f);
                         self.myBall.alpha = 1.0f;

                     } completion:^(BOOL finished) {
                         NSLog(@"Animation Finished!");
                         [self startRotation];
                     }];
}

- (void)startRotation {
    [UIView animateWithDuration:1.5f animations:^{

        self.myBall.transform = CGAffineTransformMakeRotation(M_PI);
        
    } completion:^(BOOL finished) {
        NSLog(@"Rotation Finished!");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
