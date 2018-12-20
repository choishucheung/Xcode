//
//  BNRItemStore.m
//  Homepwner
//
//  Created by choishucheung on 2018/12/2.
//  Copyright © 2018年 choishucheung. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
@interface BNRItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore

+(instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}
-(instancetype)init
{
    @throw [NSException exceptionWithName:@"singleton" reason:@"User+[BNRItemStroe shareStore]" userInfo:nil];
    return nil;
}

-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _privateItems=[[NSMutableArray alloc]init];
    }
    return  self;
}
- (NSArray *)allItem{
    return [self.privateItems copy];
}

-(BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

-(void)remoteItem:(BNRItem*)item{
    [self.privateItems removeObjectIdenticalTo:item];
}
@end
