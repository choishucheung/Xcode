//
//  BNRItem.h
//  Homepwner
//
//  Created by choishucheung on 2018/12/2.
//  Copyright © 2018年 choishucheung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSData *_dateCreated;
}

-(void) setItemName:(NSString *)str;
-(NSString *)itemName;
-(void) setSerialNumber:(NSString *)str;
-(NSString *)serialNumber;
-(void)setValueInDollars:(int)v;
-(int)valueInDollars;
-(NSData *)dateCreated;

@end
