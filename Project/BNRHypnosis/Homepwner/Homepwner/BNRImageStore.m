//
//  BNRImageStore.m
//  Homepwner
//
//  Created by v_caisxcai on 2019/2/18.
//  Copyright © 2019 choishucheung. All rights reserved.
//
#import "BNRImageStore.h"
#import <UIKit/UIKit.h>

@interface BNRImageStore()

@property (nonatomic,strong) NSMutableDictionary * dictionary;
@end

@implementation BNRImageStore
+ (instancetype) shareStore{
    static BNRImageStore *shareStore = nil;
    if(!shareStore){
        shareStore = [[self alloc]initPrivate];
    }
    return shareStore;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"User+[BNRImageStore shareStore]" userInfo:nil];
    return nil;
    
}

-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    return  self;
}

-(void) setImage:(id)image forKey:(NSString *)key{
    [self.dictionary setObject:image forKey:key];
}

-(UIImage *)imageForKey:(NSString *)key{
    return [self.dictionary objectForKey:key];
}

-(void) deleteIamgeForKey:(NSString *)key{
    if(!key){
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
