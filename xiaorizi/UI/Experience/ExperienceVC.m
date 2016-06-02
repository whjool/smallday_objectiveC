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
-(NSMutableArray *)model_list
{
    if (_model_list) {
        return _model_list;
    }
    _model_list=[@[] mutableCopy];
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
    _table.rowHeight=190;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableViewdatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return _model_list.count;
    return 10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WHDExCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    cell.backgroundColor=[UIColor redColor];
    
    return cell;
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
