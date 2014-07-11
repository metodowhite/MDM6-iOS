//
//  MWItem.m
//  RandomItems
//
//  Created by metodowhite on 10/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MWItem.h"

@implementation MWItem

- (instancetype)initWithItemName:(NSString *)name
                    valueInEuros:(int)value
                    serialNumber:(NSString *)sNumber {
    
    self = [super init];
    
    if (self) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInEuros = value;
        
        _dateCreated = [[NSDate alloc] init];
        
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
        
        NSLog(@"key: %@", key);
    }
    
    return self;
}

- (instancetype)initWithItemName:(NSString *)name {
    return [self initWithItemName:name
                     valueInEuros:0
                     serialNumber:@""];
}

- (id)init {
    return [self initWithItemName:@"item"];
}

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): worth €%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInEuros,
                                   self.dateCreated];
    
    return descriptionString;
}





+ (instancetype)randomItem {
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    //    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
    //                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
    //                            [randomNounList objectAtIndex:nounIndex]];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    MWItem *newItem = [[self alloc] initWithItemName:randomName
                                        valueInEuros:randomValue
                                        serialNumber:randomSerialNumber];
    
    return newItem;
}

















@end

















