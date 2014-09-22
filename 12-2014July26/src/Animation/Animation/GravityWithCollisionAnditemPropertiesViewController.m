//
//  GravityWithCollisionAnditemPropertiesViewController.m
//  Animation
//
//  Created by metodowhite on 26/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "GravityWithCollisionAnditemPropertiesViewController.h"

@interface GravityWithCollisionAnditemPropertiesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myBall1;
@property (weak, nonatomic) IBOutlet UIImageView *myBall2;
@property (weak, nonatomic) IBOutlet UISwitch *leSwitch;
@property (nonatomic) UIDynamicAnimator *animator;
@end

@implementation GravityWithCollisionAnditemPropertiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.myBall1, self.myBall2, self.leSwitch]];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.myBall1, self.myBall2, self.leSwitch]];
    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.myBall2, self.leSwitch]];
    propertiesBehavior.elasticity = 0.75f;
    
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:propertiesBehavior];
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];}

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
