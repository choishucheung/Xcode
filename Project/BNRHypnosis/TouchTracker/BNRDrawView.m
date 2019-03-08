//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by v_caisxcai on 2019/2/25.
//  Copyright © 2019 choishucheung. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView()
//@property (nonatomic,strong)BNRLine *currentLine;
@property (nonatomic,strong)NSMutableDictionary *linesInProgress;
@property (nonatomic,strong)NSMutableArray *finishedLines;
@end

@implementation BNRDrawView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.linesInProgress = [[NSMutableDictionary alloc]init];
        self.finishedLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        doubleTapRecognizer.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTapRecognizer];
    }
    return self;
}

-(void)strokeLine:(BNRLine *)line{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
    
}
-(void)drawRect:(CGRect)rect{
    [[UIColor blackColor]set];
    for(BNRLine *line in self.finishedLines){
        [self strokeLine:line];
    }
    [[UIColor redColor]set];
    for(NSValue *key in self.linesInProgress){
        [self strokeLine:self.linesInProgress[key]];
    }
//    if(self.linesInProgress ){
//        [[UIColor redColor]set];
//        [self strokeLine:self.currentLine];
//    }
//
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for(UITouch *t in touches){
        CGPoint location = [t locationInView:self];
        BNRLine *line = [[BNRLine alloc]init];
        line.begin = location;
        line.end = location;
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    self.currentLine = [[BNRLine alloc]init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    self.currentLine.end= location;
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
//    self.currentLine = nil;
    [self setNeedsDisplay];
}

-(void)doubleTap:(UIGestureRecognizer *)gr{
    NSLog(@"Recognized Double Tap");
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    [self setNeedsDisplay];
    
}

@end
