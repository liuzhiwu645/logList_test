//
//  LzwLogCustomTableViewCell.m
//  LogisticsList_Demo
//
//  Created by 刘志武 on 2017/8/30.
//  Copyright © 2017年 zhiwuLiu. All rights reserved.
//

#import "LzwLogCustomTableViewCell.h"
#import "LzwCustomCellContentView.h"

@interface LzwLogCustomTableViewCell ()

@property (nonatomic, strong) LzwCustomCellContentView *customView;

@end

@implementation LzwLogCustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubViewUI];
    }
    return self;
}
- (void)setHasUpLine:(BOOL)hasUpLine {
    
    self.customView.hasUpLine = hasUpLine;
}

- (void)setHasDownLine:(BOOL)hasDownLine {
    
    self.customView.hasDownLine = hasDownLine;
}

- (void)setCurrented:(BOOL)currented {
    
    self.customView.currented = currented;
}
-(void)reloadDataWithModel:(LzwLogisticsModel *)model
{
    [self.customView reloadDataWithModel:model];
}

- (void)creatSubViewUI
{
    LzwCustomCellContentView *custom = [[LzwCustomCellContentView alloc]init];
    [self addSubview:custom];
    self.customView = custom;
    
    custom.currented = NO;
    custom.hasUpLine = YES;
    custom.hasDownLine = YES;
    [custom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}



@end
