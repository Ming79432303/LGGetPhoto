//
//  LGPhotoCollectionController.m
//  自定义相册
//
//  Created by Apple_Lzzy27 on 16/11/16.
//  Copyright © 2016年 Apple_Lzzy27. All rights reserved.
//

#import "LGPhotoCollectionController.h"
#import "LGPhotoCell.h"

@interface LGPhotoCollectionController ()<UICollectionViewDelegate ,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic, strong) NSMutableArray *images;
@end

@implementation LGPhotoCollectionController
- (NSMutableArray *)images{
    
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    
    return _images;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.photo.albumName;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width/4 - 1;
    
    flowLayout.itemSize = CGSizeMake(cellW, cellW);
    
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.minimumLineSpacing = 1;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
 
    collectionView.backgroundColor = [UIColor whiteColor];



    [self.view addSubview:collectionView];
    // Register cell classes
    [collectionView registerClass:[LGPhotoCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:0 target:self action:@selector(selectedImages)];
    
    // Do any additional setup after loading the view.
}
- (void)selectedImages{
    
    NSLog(@"%@",self.images);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.photo.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LGPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (self.photo.images.count) {
         cell.imageView.image = self.photo.images[indexPath.row];
  
    }else{
        cell.imageView.image = nil;
    }
   
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
   LGPhotoCell *cell = (LGPhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selectedImage = !cell.selectedImage;
    if (cell.selectedImage) {
        [self.images addObject:cell.imageView.image];
    }
   
}

@end
