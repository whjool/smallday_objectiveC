# smallday_objectiveC
##有开发小日子有几个很不错的学习地方

##1、学习善用tableview
1、tableheader的使用,实现动态
```
this is a stretchable view in tableviewHeader,enlarge the view

这是一个可拉伸的view，主要放在UITableView的header处。 该功能是基于HFStretchableTableHeaderView作修改的，使得放在头部的view可以向下和向左右拉伸。 用于： 一些使用tableview的“个人界面”； 需要拉伸图片功能的tableview的头部； 使用：

(void)stretchHeaderForTableView:(UITableView)tableView withView:(UIView)view subViews:(UIView*)subview;
实现该方法－－view：是放拉伸的背景图片，也可以自定义一个UIView。subview：放在view之上的，可自定义subView，也可直接实例一个透明的subview。

*记得实现以下两个代理方法

(void)scrollViewDidScroll:(UIScrollView *)scrollView
(void)viewDidLayoutSubviews
如果你觉得有更好的，可以试着再改一下哦～
```

![image description](https://github.com/ljhang/StretchHeader/raw/master/head.gif)

>源码

```
#import "ViewController.h"
#import "HFStretchableTableHeaderView.h"

#define StretchHeaderHeight 200

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *mineTable;
@property (nonatomic,strong)HFStretchableTableHeaderView *stretchHeaderView;

@end

@implementation ViewController

- (UITableView *)mineTable
{
    if (_mineTable == nil) {
        _mineTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _mineTable.delegate = self;
        _mineTable.dataSource = self;
        _mineTable.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_mineTable];
    }
    return _mineTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"我的";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
 
    [self mineTable];

    [self initStretchHeader];
    
}


- (void)initStretchHeader
{
    //背景
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, StretchHeaderHeight)];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo" ofType:@"jpg"]];
    
    //背景之上的内容
    UIView *contentView = [[UIView alloc] initWithFrame:bgImageView.bounds];
    contentView.backgroundColor = [UIColor clearColor];
    
    /*
    UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    avater.image = [UIImage imageNamed:@"avater"];
    avater.center = contentView.center;
    [contentView addSubview:avater];
    */
    
    self.stretchHeaderView = [HFStretchableTableHeaderView new];
    [self.stretchHeaderView stretchHeaderForTableView:self.mineTable withView:bgImageView subViews:contentView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"reuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark - stretchableTable delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.stretchHeaderView scrollViewDidScroll:scrollView];
}

- (void)viewDidLayoutSubviews
{
    [self.stretchHeaderView resizeView];
}

@end
```
