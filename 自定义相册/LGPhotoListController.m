//
//  LGPhotoListController.m
//  自定义相册
//
//  Created by Apple_Lzzy27 on 16/11/16.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "LGPhotoListController.h"
#import "NSObject+LGGetphoto.h"
#import "LGPhoto.h"
#import "LGPhotoListCell.h"
#import "LGPhotoCollectionController.h"
@interface LGPhotoListController()
@property (nonatomic,strong) NSArray<LGPhoto *> *photoLists;
@end
@implementation LGPhotoListController
static NSString *ID = @"cellID";
- (void)viewDidLoad{
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    [NSObject lg_getThumbnailImage:^(NSArray<LGPhoto *> *photos) {
        weakSelf.photoLists = photos;
    }];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSObject lg_getOriginalImage:^(NSArray<LGPhoto *> *photos) {
        
        weakSelf.photoLists = photos;
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.tableView reloadData]; 
        });
    }];
        
    });
        self.navigationItem.title = @"相册";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LGPhotoListCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.photoLists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LGPhotoListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.photo = self.photoLists[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LGPhotoCollectionController *clVc = [[LGPhotoCollectionController alloc] init];
    clVc.photo = self.photoLists[indexPath.row];
    
    
    [self.navigationController pushViewController:clVc animated:YES];
    
}


@end
