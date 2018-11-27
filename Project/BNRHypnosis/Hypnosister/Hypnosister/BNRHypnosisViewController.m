//
//  BNRHypnosisViewController.m
//  Hypnosister
//
//  Created by v_caisxcai on 2018/11/23.
//  Copyright © 2018 v_caisxcai. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController
-(void) loadView
{
    BNRHypnosisView *backgroundView =[[BNRHypnosisView alloc] init];
    self.view = backgroundView;
    
}

@end
