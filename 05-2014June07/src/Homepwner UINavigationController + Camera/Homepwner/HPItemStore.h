//
//  HPItemStore.h
//  Homepwner
//
//  Created by metodowhite on 31/05/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MWItem;


@interface HPItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (MWItem *)createItem;
- (void)removeItem:(MWItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
