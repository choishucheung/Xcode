//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by v_caisxcai on 2018/12/29.
//  Copyright © 2018 choishucheung. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRImageStore.h"
#import "BNRItem.h"
@interface BNRDetailViewController ()
<UINavigationBarDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *SerialField;
@property (weak, nonatomic) IBOutlet UITextField *ValueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation BNRDetailViewController

-(void) setItem:(BNRItem *)item{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

-(void) viewWillAppear:(BOOL)animated{
    //[super viewWillAppear:<#animated#>];
    BNRItem *item = self.item;
    self.NameField.text = item.itemName;
    self.SerialField.text = item.serialNumber;
    self.ValueField.text = [NSString stringWithFormat:@"%d",item.valueInDollars];
    NSString *itemKey = self.item.itemkey;
    UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:itemKey];
    self.imageView.image = imageToDisplay;
}
-(void) viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
    BNRItem *item = self.item;
    item.itemName = self.NameField.text;
    item.serialNumber = self.SerialField.text;
    item.valueInDollars = [self.ValueField.text intValue];
}


- (IBAction)takePicture:(id)sender {
    UIImagePickerController *uipc = [[UIImagePickerController alloc]init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        uipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        uipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    uipc.delegate = self;
    [self presentViewController:uipc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSLog(@"key=%@",self.item.itemkey);
    [[BNRImageStore sharedStore]setImage:image forKey:self.item.itemkey];
    [self dismissViewControllerAnimated:YES completion:nil];    
}

@end
