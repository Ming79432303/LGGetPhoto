//
//  ViewController.m
//  自定义相册
//
//  Created by Apple_Lzzy27 on 16/11/16.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+LGGetphoto.h"
#import "LGPhotoListController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)getIMages:(id)sender {
    LGPhotoListController *listvc = [[LGPhotoListController alloc] initWithStyle:UITableViewStylePlain];
    listvc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:listvc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
