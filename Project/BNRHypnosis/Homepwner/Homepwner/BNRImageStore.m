//
//  BNRImageStore.m
//  Homepwner
//
//  Created by v_caisxcai on 2019/2/18.
//  Copyright © 2019 choishucheung. All rights reserved.
//
#import "BNRImageStore.h"

@interface BNRImageStore()

@property (nonatomic,strong) NSMutableDictionary * dictionary;
@end

@implementation BNRImageStore
+ (instancetype) sharedStore{
    static BNRImageStore *sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[self alloc]initPrivate];
    }
    return sharedStore;
}

- (instancetype)init{
//    @throw [NSException exceptionWithName:@"Singleton" reason:@"User+[BNRImageStore shareStore]" userInfo:nil];
    return nil;
}

-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    return  self;
}

-(void) setImage:(UIImage *)image forKey:(NSString *)key{
    self.dictionary[key] = image;
}

-(UIImage *)imageForKey:(NSString *)key{
    return self.dictionary[key];
}

-(void) deleteIamgeForKey:(NSString *)key{
    if(!key){
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
