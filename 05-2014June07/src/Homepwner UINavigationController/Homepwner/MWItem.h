//
//  MWItem.h
//  RandomItems
//
//  Created by metodowhite on 10/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWItem : NSObject

@property (nonatomic, readwrite, strong) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInEuros;
@property (nonatomic, readonly) NSDate *dateCreated;

//Initializers
- (instancetype)initWithItemName:(NSString *)name;

// Designated initializer for MWItem
- (instancetype)initWithItemName:(NSString *)name
                    valueInEuros:(int)value
                    serialNumber:(NSString *)sNumber;


+ (instancetype)randomItem;

@end





















