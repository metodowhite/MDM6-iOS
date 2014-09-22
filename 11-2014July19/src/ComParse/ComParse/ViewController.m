//
//  ViewController.m
//  ComParse
//
//  Created by metodowhite on 19/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)create:(id)sender {
    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
    gameScore[@"score"] = @156;
    gameScore[@"playerName"] = @"Akira Kurosawa 2";
    gameScore[@"cheatMode"] = @NO;
    
    [gameScore saveInBackground];
    // [gameScore saveEventually];
}

- (IBAction)retrieve:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    [query getObjectInBackgroundWithId:@"zXhrz9UhyL" block:^(PFObject *object, NSError *error) {
        NSLog(@"%@", object.createdAt);
        NSLog(@"%@", object[@"playerName"]);
    }];
}

- (IBAction)update:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    [query getObjectInBackgroundWithId:@"zXhrz9UhyL" block:^(PFObject *object, NSError *error) {
        object[@"cheatMode"] = @YES;
        object[@"score"] = @667;
        [object addUniqueObjectsFromArray:@[@"kungfu", @"funky"] forKey:@"skills"];
        [object saveInBackground];
    }];
}

- (IBAction)increment:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    [query getObjectInBackgroundWithId:@"zXhrz9UhyL" block:^(PFObject *object, NSError *error) {
        [object incrementKey:@"score"];
        [object saveInBackground];
    }];
}

- (IBAction)delete:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    [query getObjectInBackgroundWithId:@"zXhrz9UhyL" block:^(PFObject *object, NSError *error) {
        [object deleteInBackground];
    }];
}

- (IBAction)relational:(id)sender {
    PFObject *lePost = [PFObject objectWithClassName:@"Post"];
    lePost[@"title"] = @"Tengo Hambre";
    lePost[@"content"] = @"No se que me apetece comer…😔";
    
    PFObject *leComment = [PFObject objectWithClassName:@"Comment"];
    leComment[@"content"] = @"Sushi!!!";
    
    leComment[@"parent"] = lePost;
    [leComment saveInBackground];
}

- (IBAction)query:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    
    // [query whereKey:@"playerName" equalTo:@"Akira Kurosawa 2"];
    [query whereKey:@"playerName" notEqualTo:@"Akira Kurosawa"];
    [query whereKey:@"score" greaterThan:@100];
    query.limit = 10;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (PFObject *object in objects) {
            NSLog(@"%@", object.objectId);
        }
    }];
    
    // [query getFirstObjectInBackgroundWithBlock:<#^(PFObject *object, NSError *error)block#>]
    // query.skip = 10;
    // [query orderByAscending:@"score"];
    query.cachePolicy = kPFCachePolicyNetworkElseCache;
}

@end







































