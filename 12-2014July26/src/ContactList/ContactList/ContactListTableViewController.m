//
//  ContactListTableViewController.m
//  ContactList
//
//  Created by metodowhite on 26/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ContactListTableViewController.h"

@interface ContactListTableViewController ()

//@property (nonatomic, strong) NSArray *userNames;
//@property (nonatomic, strong) NSArray *userAvatars;

@property (nonatomic, strong) NSArray *users;



@end

@implementation ContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.userNames = @[@"Ricky Carter", @"Penny Watts", @"Dwight Ramos", @"Lee Terry", @"Lillie Turner", @"Savannah Peters"];
//    self.userAvatars = @[@"9.jpg", @"28.jpg", @"60.jpg", @"85.jpg", @"54.jpg", @"6.jpg"];

    self.users = @[
                   @{@"name":@"Ricky Carter", @"avatar": @"9.jpg"},
                   @{@"name":@"Penny Watts", @"avatar": @"28.jpg"},
                   @{@"name":@"Dwight Ramos", @"avatar": @"60.jpg"},
                   @{@"name":@"Lee Terry", @"avatar": @"85.jpg"},
                   @{@"name":@"Lillie Turner", @"avatar": @"54.jpg"},
                   @{@"name":@"Savannah Peters", @"avatar": @"6.jpg"}
                   ];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_users count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"theCell" forIndexPath:indexPath];
    
    NSDictionary *user = self.users[indexPath.row];
    
    cell.textLabel.text = user[@"name"];
    cell.imageView.image = [UIImage imageNamed:user[@"avatar"]];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
