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
        //        [items addObject:@"One"];
        //        [items addObject:@"Two"];
        //        [items addObject:@"Three"];
        //
        //        [items insertObject:@"Zero" atIndex:0];
        // equivalente en otro lenguaje: items.insertObject("Zero", 0);
        
        
        //        for (int i = 0; i < [items count]; i++) {
        //            NSString *item = [items objectAtIndex:i];
        //            NSLog(@"%@", item);
        //        }
        
        // Fast Enumeration
        //        for (NSString *item in items) {
        //            NSLog(@"%@", item);
        //        }
        //
        //        int a = 1;
        //        float b = 2.5;
        //        char c = 'A';
        //        NSLog(@"Integer: %d Float: %f Char: %c", a, b, c);
        
        
        //        MWItem *item = [[MWItem alloc] init];
        
        //        [item setItemName:@"Red Sofa"];
        //        [item setSerialNumber:@"A1B2C"];
        //        [item setValueInEuros:100];
        //
        //        NSLog(@"%@ %@ %@ %d",
        //              [item itemName],
        //              [item dateCreated],
        //              [item serialNumber],
        //              [item valueInEuros]);
        
        
        // dot syntax
        //        item.itemName = @"Red Sofa"; // uses setItemName:
        //        item.serialNumber = @"A1B2C";
        //        item.valueInEuros = 100;
        
        //        NSLog(@"%@ %@ %@ %d",
        //              item.itemName,
        //              item.dateCreated,
        //              item.serialNumber,
        //              item.valueInEuros);
        
        
        
        
        
        //        MWItem *item = [[MWItem alloc] initWithItemName:@"Red Sofa"
        //                                           valueInEuros:100
        //                                           serialNumber:@"A1B2C"];
        //
        //        NSLog(@"%@", item);
        

        for (int i = 0; i < 10; i++) {
            MWItem *item = [MWItem randomItem];
            [items addObject:item];
        }

// Error inducido para reconocer "unrecognized selector sent to instance"
//        id lastObj = [items lastObject];
//        [lastObj count];
        
        for (MWItem *item in items) {
            NSLog(@"%@", item);
        }
        
        
        items = nil;
    }
    return 0;
}
















