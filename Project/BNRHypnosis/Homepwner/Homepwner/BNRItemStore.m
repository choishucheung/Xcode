//
//  BNRItemStore.m
//  Homepwner
//
//  Created by choishucheung on 2018/12/2.
//  Copyright © 2018年 choishucheung. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

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
    return  self;
}

@end
