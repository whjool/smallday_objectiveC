//
//  WHDExCell.m
//  xiaorizi
//
//  Created by HUN on 16/6/1.
//  Copyright © 2016年 hundred Company. All rights reserved.
//

#import "WHDExCell.h"
#import "WHDExModel.h"


@interface WHDExCell ()
@property (weak, nonatomic) IBOutlet UIImageView *EXimage;
@property (weak, nonatomic) IBOutlet UILabel *EXlabel;


@end


@implementation WHDExCell

-(void)setModel:(WHDExModel *)model
{
    _model=model;
    
}

@end
