//
//  HPItemStore.m
//  Homepwner
//
//  Created by metodowhite on 31/05/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "HPItemStore.h"
#import "MWItem.h"
#import "HPImageStore.h"

@interface HPItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation HPItemStore

+ (instancetype)sharedStore {
    static HPItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use: + [HPItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems {
    //TODO: pensar en la no existencia de _allItems ?;
    return self.privateItems;
}

- (MWItem *)createItem {
    MWItem *item = [MWItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(MWItem *)item {
    NSString *key = item.itemKey;
    [[HPImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) {
        return;
    }
    
    MWItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end



























