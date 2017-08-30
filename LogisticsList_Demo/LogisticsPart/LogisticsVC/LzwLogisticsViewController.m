//
//  LzwLogisticsViewController.m
//  LogisticsList_Demo
//
//  Created by 刘志武 on 2017/8/30.
//  Copyright © 2017年 zhiwuLiu. All rights reserved.
//

#import "LzwLogisticsViewController.h"
#import "LzwLogisticsView.h"
#import "LzwLogisticsModel.h"

@interface LzwLogisticsViewController ()
@property (nonatomic,strong) NSMutableArray * dataArry;

@end

@implementation LzwLogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"物流信息";
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:LzwColor(0xececec)];
    self.dataArry = [NSMutableArray array];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray *titleArr = [NSArray arrayWithObjects:
                         @"[吉林省四平市服务部]快件已接收,谢谢你的关注, 哈哈哈哈哈哈哈哈哈哈哈, 哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                         @"[吉林省四平市服务部]到达目的地网店，快件派送中..." ,
                         @"[护甲驼子公司]进行派件扫描；派送业务员：大大王；联系电话：17600000123",
                         @"[吉林分拨中心]在分拨中心进行卸车扫描",
                         @"[吉林四平分拨中心]在扫描",
                         @"[商家出库中...]正在出库",nil];
    NSArray *timeArr = [NSArray arrayWithObjects:
                        @"2014-04-04 11:59:00",
                        @"2014-04-03 07:59:00",
                        @"2014-04-03 08:22:00",
                        @"2014-04-03 12:34:22",
                        @"2014-04-02 16:59:00",
                        @"2014-04-02 22:10:00",nil];
    for (NSInteger i = titleArr.count - 1; i>=0; i--) {
        LzwLogisticsModel *modelL = [[LzwLogisticsModel alloc]init];
        modelL.dsc = [titleArr objectAtIndex:i];
        modelL.date = [timeArr objectAtIndex:i];
        [self.dataArry addObject:modelL];
    }
    
    //数组倒序
    self.dataArry = (NSMutableArray *)[[self.dataArry reverseObjectEnumerator]allObjects];
    LzwLogisticsView *logisView = [[LzwLogisticsView alloc]initWithDatas:_dataArry];
    // 给headView赋值
    logisView.wltype=@"已签收";
    logisView.number = @"53451213141";
    logisView.company = @"神马快递";
    logisView.phone = @"010-333-444";
    logisView.imageUrl = @"";
    logisView.frame = CGRectMake(0, 64, LZWScreenWidth, LZWScreenHeight-64);
    [self.view addSubview:logisView];
    
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

@end
