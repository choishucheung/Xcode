//
//  BNRItem.h
//  Homepwner
//
//  Created by choishucheung on 2018/12/2.
//  Copyright © 2018年 choishucheung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
@property BNRItem *containedItem;
@property NSString* itemName;
@property NSString* serialNumber;
@property int valueInDollars;
@property NSString* dateCreated;
@property(nonatomic,copy) NSString* itemkey;
+(instancetype)randomItem;
-(instancetype)initWithItemName:(NSString*)name valueInDollars:(int)value serialNumber:(NSString*)sNumber;
-(instancetype)initWithItemName:(NSString *)name;

@end
