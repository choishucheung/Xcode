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
@interface BNRItemsViewController()
@property (nonatomic,strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController
- (instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self){
        //for(int i=0;i<5;i++){
        //    [[BNRItemStore sharedStore]createItem];
        //}
        UINavigationItem *uini= self.navigationItem;
        UIBarButtonItem *ubbi = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        uini.rightBarButtonItem = ubbi;
        uini.leftBarButtonItem = self.editButtonItem;
        uini.title = @"Homepwner";
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
    //UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[BNRItemStore sharedStore]allItem];
    BNRItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSArray *items = [[BNRItemStore sharedStore]allItem];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore]remoteItem:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[BNRItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row
     ];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    //UIView *header = self.headerView;
    //[self.tableView setTableHeaderView:header];
}


- (IBAction)addNewItem:(id)sender
{
    //NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    BNRItem *newItem =[[BNRItemStore sharedStore]createItem];
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItem]indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

//-(IBAction)togglEditngMode:(id)sender
//{
//    if(self.isEditing){
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        [self setEditing:NO animated:YES];
//    }else{
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        [self setEditing:YES animated:NO];
//    }
//}

//-(UIView *)headerView{
//    if(!_headerView){
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
//    }
//    return _headerView;
//}
- (NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    return@"删除";
    
}
-(BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = [[BNRItemStore sharedStore] allItem];
    if (indexPath.row + 1 == [items count]) {
        return NO;
    }
    return YES;
}

-(NSIndexPath *) tableView: (UITableView *) tableView
targetIndexPathForMoveFromRowAtIndexPath: (NSIndexPath *) source
       toProposedIndexPath: (NSIndexPath *) destination
{
    NSArray *items = [[BNRItemStore sharedStore] allItem];
    if (destination.row < [items count] - 1) {
        return destination;
    }
    NSIndexPath *indexPath = nil;
    // If your table can have <= 2 items, you might want to robusticize the index math.
    if (destination.row == 0) {
        indexPath = [NSIndexPath indexPathForRow: 1  inSection: 0];
    } else {
        indexPath = [NSIndexPath indexPathForRow: items.count - 2
                                       inSection: 0];
    }
    return indexPath;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *bdvc = [[BNRDetailViewController alloc]init];
    [self.navigationController pushViewController:bdvc animated:YES];
    NSArray *items = [[BNRItemStore sharedStore]allItem];
    BNRItem *item = items[indexPath.row];
    bdvc.item = item;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];
    
}

@end
