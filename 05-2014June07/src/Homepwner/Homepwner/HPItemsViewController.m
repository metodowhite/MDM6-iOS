//
//  HPItemsViewController.m
//  Homepwner
//
//  Created by metodowhite on 31/05/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "HPItemsViewController.h"
#import "HPItemStore.h"
#import "MWItem.h"

@interface HPItemsViewController()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end


@implementation HPItemsViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
//        for (int i = 0; i < 5; i++) {
//            [[HPItemStore sharedStore] createItem];
//        }
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"leCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[HPItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leCell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leCell"
                                                            forIndexPath:indexPath];
    
    NSArray *items = [[HPItemStore sharedStore] allItems];
    MWItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}




- (IBAction)addNewItem:(id)sender {
    MWItem *newItem = [[HPItemStore sharedStore] createItem];
    
    NSInteger lastRow = [[[HPItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
}




- (IBAction)toggleEditingMode:(id)sender {
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[HPItemStore sharedStore] allItems];
        MWItem *item = items[indexPath.row];
        [[HPItemStore sharedStore] removeItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    [[HPItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                       toIndex:destinationIndexPath.row];
}


- (UIView *)headerView {
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    return _headerView;
}

@end






























