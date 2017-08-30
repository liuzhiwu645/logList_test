//
//  LzwLogisticsModel.m
//  LogisticsList_Demo
//
//  Created by 刘志武 on 2017/8/30.
//  Copyright © 2017年 zhiwuLiu. All rights reserved.
//

#import "LzwLogisticsModel.h"

@interface LzwLogisticsModel ()

@property (nonatomic, assign) CGFloat tempHeight;

@end

@implementation LzwLogisticsModel

-(CGFloat)height
{
    if (_tempHeight == 0) {
        NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:12.0] forKey:NSFontAttributeName];
        CGRect rect = [self.dsc boundingRectWithSize:CGSizeMake(LZWScreenWidth - 50 - 2 * 10, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        _tempHeight = rect.size.height + 50;
    }
    return _tempHeight;
}

@end
