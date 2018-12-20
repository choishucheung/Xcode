//
//  BNRItem.m
//  Homepwner
//
//  Created by choishucheung on 2018/12/2.
//  Copyright © 2018年 choishucheung. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

-(instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber{
    self = [super init];
    if(self){
        _itemName = name;
        _serialNumber=sNumber;
        _valueInDollars=value;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

+(instancetype)randomItem{
    NSArray *randomAdjectiveList = @[@"Fluffy",@"Rusty",@"Shiny"];
    NSArray *randomNounList=@[@"a",@"b",@"c"];
    NSInteger nounIndex = arc4random()%[randomNounList count];
    NSInteger adjIndex = arc4random()%[randomAdjectiveList count];
    NSString* randomName=[NSString stringWithFormat:@"%@%@",randomAdjectiveList[adjIndex],randomNounList[nounIndex]];
    
    int randomValue=arc4random()%100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0'+arc4random()%10,
                                    'A'+arc4random()%26,
                                    '0'+arc4random()%10,
                                    'A'+arc4random()%26,
                                    '0'+arc4random()%10];
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
}

@end
