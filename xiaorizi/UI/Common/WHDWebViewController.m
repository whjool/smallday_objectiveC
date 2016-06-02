//
//  WHDWebViewController.m
//  xiaorizi
//
//  Created by HUN on 16/6/2.
//  Copyright © 2016年 hundred Company. All rights reserved.
//

#import "WHDWebViewController.h"
@interface WHDWebViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@property(nonatomic,assign)CGFloat rate;
@end

@implementation WHDWebViewController



-(void)setPath:(NSString *)path
{
    _path=path;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.navigationItem.hidesBackButton=YES;
    [self setUpTableItem];
    
    [self setUpWebView];
}
-(void)setUpWebView
{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:_path]];
    [_myWebView loadRequest:request];
    _myWebView.scrollView.delegate=self;
    self.rate=_myWebView.scrollView.contentOffset.y/_myWebView.scrollView.contentSize.height;
}

-(void)setUpTableItem
{
    
    CGRect bRect=(CGRect){0,0,40,40};
    //喜欢
    UIButton *libtn=[UIButton setImageAndTitleWithrame:bRect
                                        andNomalName:nil
                                       andNomalImage:@"collect_1"
                                      andSeletedName:nil
                                     andSeletedImage:@"collect_2"];
    [libtn addTarget:self action:@selector(like:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *likebarBtn=[[UIBarButtonItem alloc]initWithCustomView:libtn];
    likebarBtn.tag=1;
    
    //分享
    UIButton *shareBtn=[[UIButton alloc]initWithFrame:bRect];
    [shareBtn setImage:[UIImage imageNamed:@"edit.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *sharebarBtn=[[UIBarButtonItem alloc]initWithCustomView:shareBtn];
    sharebarBtn.tag=2;
    
    //加到右边
    self.navigationItem.rightBarButtonItems=@[sharebarBtn,likebarBtn];
}
-(void)like:(UIButton *)btn
{
    btn.selected=!btn.selected;
}

-(void)share:(UIButton *)btn
{
    NSLog(@"分享准备中.....");
}

#pragma mark delegate
//试着设置偏移的时候把透明度降低
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    [self.navigationController.navigationBar setBarTintColor:[UIColor  colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:scrollView.contentOffset.y*self.rate]];
    if (scrollView.contentOffset.y/scrollView.contentSize.height>0.1) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    
//    self.navigationController.navigationBar.alpha=scrollView.contentOffset.y/scrollView.contentSize.height;
//    NSLog(@"-----");
}


//-(void)webViewDidStartLoad:(UIWebView *)webView
//{
//    NSLog(@"--->开始");
//}
//
//
//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    NSLog(@"--->结束");
//}
//
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
//{
//    NSLog(@"%s---->error:%@",__func__,error);
//}


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
