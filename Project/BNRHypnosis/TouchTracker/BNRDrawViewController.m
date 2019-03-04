//
//  UIViewController+BNRDrawViewController.m
//  TouchTracker
//
//  Created by v_caisxcai on 2019/2/25.
//  Copyright © 2019 choishucheung. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

-(void) loadView{
    self.view = [[BNRDrawView alloc]initWithFrame:CGRectZero];
}



@end
