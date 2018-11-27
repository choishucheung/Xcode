//
//  BNRReminderViewController.m
//  Hypnosister
//
//  Created by v_caisxcai on 2018/11/23.
//  Copyright © 2018 v_caisxcai. All rights reserved.
//

#import "BNRReminderViewController.h"
@interface BNRReminderViewController()
@property IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController
-(IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"设置日期 %@",date);
}

@end
