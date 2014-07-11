//
//  REItemsTableViewController.m
//  RERepasoEjercicio
//
//  Created by metodowhite on 14/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "REItemsTableViewController.h"


@interface REItemsTableViewController()

@property (nonatomic, strong) NSArray *miArr;

@end

@implementation REItemsTableViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
        self.tabBarItem.title = @"Animalicos";
        
        self.tabBarItem.image = [UIImage imageNamed: @"iconoTabla"];
        
        self.miArr = @[@"perro", @"gato", @"planeador del azucar", @"chinchilla"];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    self = [self init];

    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"dasCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_miArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"dasCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.miArr[indexPath.row];
    
    return cell;
    
}

@end









