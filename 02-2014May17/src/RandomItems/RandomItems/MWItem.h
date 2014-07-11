//
//  MWItem.h
//  RandomItems
//
//  Created by metodowhite on 10/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWItem : NSObject
//{
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInEuros;
//    NSDate *_dateCreated;
//}
//
//- (void)setItemName:(NSString *)str; //Setter
//- (NSString *)itemName; //Getter
//
//- (void)setSerialNumber:(NSString *)str;
//- (NSString *)serialNumber;
//
//- (void)setValueInEuros:(int)v;
//- (int)valueInEuros;
//
//- (NSDate *)dateCreated; //propiedad solo de lectura

@property (nonatomic, readwrite, strong) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInEuros;
@property (nonatomic, readonly) NSDate *dateCreated;


//Initializers

- (instancetype)initWithItemName:(NSString *)name;
//- (instancetype)initWithPelotas:(MWPelotas *)pelotas;

// Designated initializer for MWItem
- (instancetype)initWithItemName:(NSString *)name
                    valueInEuros:(int)value
                    serialNumber:(NSString *)sNumber;


+ (instancetype)randomItem;

@end





















