//
//  LzwLogisticsView.m
//  LogisticsList_Demo
//
//  Created by 刘志武 on 2017/8/30.
//  Copyright © 2017年 zhiwuLiu. All rights reserved.
//

#import "LzwLogisticsView.h"
#import "LzwLogCustomTableViewCell.h"
#import "LzwLogisticsModel.h"

@interface LzwLogisticsView ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic)UITableView *table;

@end

@implementation LzwLogisticsView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithDatas:(NSArray *)array
{
    self = [super init];
    if (self) {
        [self.dataArray addObjectsFromArray:array];
    }
    return self;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)reloadDataWithDatas:(NSArray *)array {
    
    [self.dataArray addObjectsFromArray:array];
    [self.table reloadData];
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)setWltype:(NSString *)wltype {
    _wltype = wltype;
    self.headerView.wltype = wltype;
}
-(void)setNumber:(NSString *)number {
    _number = number;
    self.headerView.number = number;
}
- (void)setCompany:(NSString *)company {
    _company = company;
    self.headerView.company = company;
}
- (void)setPhone:(NSString *)phone {
    _phone = phone;
    self.headerView.phone = phone;
}
- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    self.headerView.imageUrl = imageUrl;
}
- (void)setDatas:(NSArray *)datas {
    if (_datas == datas) {
        
        _datas = datas;
    }
    
    [self.table reloadData];
}


- (void)setupUI
{
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:table];
    [table setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.table = table;
    
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    //创建TableView的头视图
    self.headerView=[[LzwTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, LZWScreenWidth, 123)];;
    
    //[table registerClass:[LZTableHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
    self.headerView.userInteractionEnabled=YES;
    self.table.tableHeaderView=self.headerView;

    //注册cell
    [self.table registerClass:[LzwLogCustomTableViewCell class] forCellReuseIdentifier:@"cellLog"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LzwLogCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellLog"];
    
    //判断最后一个cell和第一个cell显示
    if (indexPath.row == 0) {
        cell.hasUpLine = NO;
        cell.currented = YES;
    } else {
        cell.hasUpLine = YES;
        cell.currented = NO;
    }
    
    if (indexPath.row == self.dataArray.count - 1) {
        cell.hasDownLine = NO;
    } else {
        cell.hasDownLine = YES;
    }
    
    LzwLogisticsModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell reloadDataWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LzwLogisticsModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    return model.height;
}

#pragma mark 拨打电话
-(void)BoHao{
    NSLog(@"我要开始拨号了");
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 1;
}

@end
