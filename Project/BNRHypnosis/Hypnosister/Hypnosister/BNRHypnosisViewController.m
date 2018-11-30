//
//  BNRHypnosisViewController.m
//  Hypnosister
//
//  Created by v_caisxcai on 2018/11/23.
//  Copyright © 2018 v_caisxcai. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
@interface BNRHypnosisViewController()<UITextFieldDelegate>
@property UILabel * UILabels;
@end
@implementation BNRHypnosisViewController


-(void) loadView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]initWithFrame:frame];
    CGRect textFieldRect = CGRectMake(40,70,240,30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"yes";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [backgroundView addSubview:textField];
    self.view = backgroundView;
}

-(BOOL)
:(UITextField *)textField{
    NSLog(@"%@",textField.text);
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self drawHypnoticMessage:textField.text];
    textField.text=@"";
    [textField resignFirstResponder];
    return YES;
}

-(void)drawHypnoticMessage:(NSString*)message{
    for(int i=0;i<20;i++){
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor=[UIColor blackColor];
        messageLabel.text = message;
        [messageLabel sizeToFit];
        int width = (int)(self.view.bounds.size.width-messageLabel.bounds.size.width);
        int x=arc4random()% width;
        int height = (int)(self.view.bounds.size.height-messageLabel.bounds.size.height);
        int y = arc4random()% height;
        CGRect frame= messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame=frame;
        [self.view addSubview:messageLabel];
    }
    
}

@end
