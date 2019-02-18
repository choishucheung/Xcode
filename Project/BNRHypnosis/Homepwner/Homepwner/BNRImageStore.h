//
//  BNRImageStore.h
//  Homepwner
//
//  Created by v_caisxcai on 2019/2/18.
//  Copyright © 2019 choishucheung. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BNRImageStore:NSObject
+(instancetype) sharedStore;
-(void) setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageForKey:(NSString *)key;
-(void) deleteIamgeForKey:(NSString *)key;
@end

