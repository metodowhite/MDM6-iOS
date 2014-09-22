//
//  SnapViewController.m
//  Animation
//
//  Created by metodowhite on 26/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myBall;
@property (weak, nonatomic) IBOutlet UIImageView *myBall2;
@property (nonatomic) UIDynamicAnimator *animator;
@end

@implementation SnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleGesture:(id)sender {
    CGPoint point = [sender locationInView:self.view];
    
    if ([self.animator behaviors]) {
        [self.animator removeAllBehaviors];
    }
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.myBall, self.myBall2]];
    [self.animator addBehavior:collisionBehavior];
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.myBall snapToPoint:point];
    [self.animator addBehavior:snapBehavior];
    

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
