//
//  MineVC.m
//  xiaorizi
//
//  Created by HUN on 16/6/1.
//  Copyright © 2016年 hundred Company. All rights reserved.
//

#import "MineVC.h"
#import "WHDYaoYiYao.h"
#import "WHDShowMyInfo.h"
@interface MineVC ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)NSArray *item_arr;
@property(nonatomic,strong)NSArray *item_imgs;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem=nil;
    [self setUpRightBar];
    [self setUptable];
    
}
#pragma mark 右边工具
-(void)setUpRightBar
{
    
    UIButton *btn=[[UIButton alloc]initWithFrame:(CGRect){0,0,40,40}];
    [btn setImage:[UIImage imageNamed:@"settinghhhh"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"settingh"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(searchWay) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *toolItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=toolItem;
}

/**
 *  跳转到我的工具栏
 */

-(void)searchWay
{
    WHDShowMyInfo *view=[WHDShowMyInfo WHDShowTableView];
    [self.navigationController pushViewController:view animated:YES];
}

#pragma mark 设置tableview
-(void)setUptable
{
    
    self.item_arr=@[@"个人中心",@"我的订单",@"我的收藏",@"留言反馈",@"应用推荐"];
    self.item_imgs=@[@"recomment",@"recomment",@"recomment",@"recomment",@"recomment"];
    _table.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    _table.separatorColor=[UIColor blackColor];
    _table.rowHeight=70;
    _table.bounces=NO;
}

#pragma mark datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return self.item_arr.count;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:myCellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCellID];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section==0) {
        cell.textLabel.text=self.item_arr[indexPath.row];
        cell.imageView.image=[UIImage imageNamed:self.item_imgs[indexPath.row]];
    }else
    {
        cell.textLabel.text=@"摇一摇 每天都有小惊喜";
        cell.imageView.image=[UIImage imageNamed:@"yaoyiyao"];
    }
    return cell;
}


#pragma mark delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        NSLog(@"yayaya");
    }else
    {
        WHDYaoYiYao *yaoVC=[[WHDYaoYiYao alloc]init];
        [self.navigationController pushViewController:yaoVC animated:YES];
    }
    
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
