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

@implementation HPItemsViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5000; i++) {
            [[HPItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
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

@end













