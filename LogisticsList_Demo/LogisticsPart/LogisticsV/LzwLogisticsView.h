//
//  LzwLogisticsView.h
//  LogisticsList_Demo
//
//  Created by 刘志武 on 2017/8/30.
//  Copyright © 2017年 zhiwuLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LzwTableHeaderView.h"

@interface LzwLogisticsView : UIView


/**
 运单号码
 */
@property (copy, nonatomic)NSString *number;

/**
 承运公司
 */
@property (copy, nonatomic)NSString *company;

/**
 官方电话
 */
@property (copy, nonatomic)NSString *phone;

/**
 物流状态
 */
@property (nonatomic,copy) NSString * wltype;

/**
 图片url
 */
@property (nonatomic,copy) NSString * imageUrl;
@property (strong, nonatomic)NSArray *datas;
@property (nonatomic,strong) LzwTableHeaderView *headerView;
- (instancetype)initWithDatas:(NSArray*)array;
- (void)reloadDataWithDatas:(NSArray *)array;

@end
