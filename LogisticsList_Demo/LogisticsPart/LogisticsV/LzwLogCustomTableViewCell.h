//
//  LzwLogCustomTableViewCell.h
//  LogisticsList_Demo
//
//  Created by 刘志武 on 2017/8/30.
//  Copyright © 2017年 zhiwuLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LzwLogisticsModel.h"

@interface LzwLogCustomTableViewCell : UITableViewCell

@property (assign, nonatomic) BOOL hasUpLine;
@property (assign, nonatomic) BOOL hasDownLine;
@property (assign, nonatomic) BOOL currented;

- (void)reloadDataWithModel:(LzwLogisticsModel *)model;

@end
