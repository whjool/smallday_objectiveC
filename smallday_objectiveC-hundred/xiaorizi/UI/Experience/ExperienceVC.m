//
//  ExperienceVC.m
//  xiaorizi
//
//  Created by HUN on 16/6/1.
//  Copyright © 2016年 hundred Company. All rights reserved.
//

#import "ExperienceVC.h"
#import "WHDExCell.h"
#import "WHDExModel.h"

#define cellID @"WHDExCell"
@interface ExperienceVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@property(nonatomic,strong)NSMutableArray *model_list;

@end

@implementation ExperienceVC
#pragma mark - lazy load
//读取数据
-(NSMutableArray *)model_list
{
    if (_model_list) {
        return _model_list;
    }
    _model_list=[@[] mutableCopy];
    
    //开始获取数据
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Experience" ofType:nil];
    NSData *data=[NSData dataWithContentsOfFile:path];
    //把数据转成字典
    NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    //模型数据
    NSArray *modelArr=dataDic[@"list"];
    for (NSDictionary *dic in modelArr) {
        WHDExModel *model=[WHDExModel mj_objectWithKeyValues:dic];
        [_model_list addObject:model];
    }
    return _model_list;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpView];
    
}

-(void)setUpView
{
    self.title=@"体验";
    [_table registerNib:[UINib nibWithNibName:cellID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
    //    _table.estimatedRowHeight=1000;
    //    _table.rowHeight=UITableViewAutomaticDimension;
    _table.rowHeight=150;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableViewdatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return _model_list.count;
    return self.model_list.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WHDExCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    cell.backgroundColor=[UIColor redColor];
    cell.model=self.model_list[indexPath.row];
    return cell;
}

#pragma mark - tableheader
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:(CGRect){0,0,10,10}];
    view.backgroundColor=[UIColor redColor];
    return view;
}


@end
