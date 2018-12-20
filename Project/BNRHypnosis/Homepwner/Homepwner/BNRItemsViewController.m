//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by choishucheung on 2018/12/2.
//  Copyright © 2018年 choishucheung. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
@implementation BNRItemsViewController
- (instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self){
        for(int i=0;i<5;i++){
            [[BNRItemStore sharedStore]createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[BNRItemStore sharedStore]allItem]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    NSArray *items = [[BNRItemStore sharedStore]allItem];
    BNRItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
