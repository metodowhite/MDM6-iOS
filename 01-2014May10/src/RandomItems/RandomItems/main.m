//
//  main.m
//  RandomItems
//
//  Created by metodowhite on 10/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        [items insertObject:@"Zero" atIndex:0];
        // equivalente en otro lenguaje: items.insertObject("Zero", 0);
 
        
//        for (int i = 0; i < [items count]; i++) {
//            NSString *item = [items objectAtIndex:i];
//            NSLog(@"%@", item);
//        }
        
        // Fast Enumeration
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        int a = 1;
        float b = 2.5;
        char c = 'A';
        NSLog(@"Integer: %d Float: %f Char: %c", a, b, c);
        
        
        items = nil;
    }
    return 0;
}
















