//
//  LGPhoto.h
//  获得相册中的图片
//
//  Created by ming on 16/11/10.
//  Copyright © 2016年 ming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LGPhoto : NSObject
@property(nonatomic, copy) NSString *albumName;
@property(nonatomic, strong) NSArray <UIImage *> *images;
+ (instancetype)phototTitle:(NSString *)albumName images:(NSArray *)images;
@end
