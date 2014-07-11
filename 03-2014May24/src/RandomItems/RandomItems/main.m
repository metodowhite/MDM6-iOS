//
//  main.m
//  RandomItems
//
//  Created by metodowhite on 10/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWItem.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
       
        for (int i = 0; i < 10; i++) {
            MWItem *item = [MWItem randomItem];
            [items addObject:item];
        }

        for (MWItem *item in items) {
            NSLog(@"%@", item);
        }
        
        
        items = nil;
    }
    return 0;
}
















