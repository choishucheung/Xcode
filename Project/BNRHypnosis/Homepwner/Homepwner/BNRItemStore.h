//
//  BNRItemStore.h
//  Homepwner
//
//  Created by choishucheung on 2018/12/2.
//  Copyright © 2018年 choishucheung. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;
@interface BNRItemStore : NSObject
@property (nonatomic,readonly) NSArray *allItem;
+(instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)remoteItem:(BNRItem*)item;
-(void)moveItemAtIndex:(NSUInteger)formIndex toIndex:(NSInteger)toIndex;
@end
