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
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
@end

@implementation BNRReminderViewController
-(IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"设置日期 %@",date);
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"！";
    note.fireDate = date;
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:<#animated#>];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
    
}


@end
