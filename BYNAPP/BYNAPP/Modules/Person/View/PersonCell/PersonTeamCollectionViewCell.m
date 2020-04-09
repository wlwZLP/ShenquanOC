//
//  PersonTeamCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonTeamCollectionViewCell.h"



@implementation PersonTeamCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
       
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup
{
    
    
    UIView * LeftBGView = [[UIView alloc] init];
    LeftBGView.frame = CGRectMake(0, 0, YYScreenWidth/4, 72);
    LeftBGView.backgroundColor = [UIColor clearColor];
    [self addSubview:LeftBGView];
    
    UIImageView * LeftImage = [[UIImageView alloc] init];
    LeftImage.backgroundColor = [UIColor clearColor];
    LeftImage.image = [UIImage imageNamed:@"MyOrder"];
    LeftImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 24, 22);
    [LeftBGView addSubview:LeftImage];
   
    UILabel * LeftTitle = [[UILabel alloc]init];
    LeftTitle.text = @"我的订单";
    LeftTitle.textColor = YY66Color;
    LeftTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    LeftTitle.textAlignment = NSTextAlignmentLeft;
    LeftTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [LeftBGView addSubview:LeftTitle];
    
    UIButton * LeftBtn = [[UIButton alloc]init];
    LeftBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [LeftBtn setBackgroundColor:[UIColor clearColor]];
    [LeftBtn addTarget:self action:@selector(LeftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [LeftBGView addSubview:LeftBtn];

    UIView * LeftCenterView = [[UIView alloc] init];
    LeftCenterView.frame = CGRectMake(YYScreenWidth/4, 0, YYScreenWidth/4, 72);
    LeftCenterView.backgroundColor = [UIColor clearColor];
    [self addSubview:LeftCenterView];
    
    UIImageView * LeftCenterImage = [[UIImageView alloc] init];
    LeftCenterImage.backgroundColor = [UIColor clearColor];
    LeftCenterImage.image = [UIImage imageNamed:@"MyTeamOrder"];
    LeftCenterImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 24, 22);
    [LeftCenterView addSubview:LeftCenterImage];
   
    UILabel * LeftCenterTitle = [[UILabel alloc]init];
    LeftCenterTitle.text = @"团队订单";
    LeftCenterTitle.textColor = YY66Color;
    LeftCenterTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    LeftCenterTitle.textAlignment = NSTextAlignmentLeft;
    LeftCenterTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [LeftCenterView addSubview:LeftCenterTitle];
    
    UIButton * LeftCenterBtn = [[UIButton alloc]init];
    LeftCenterBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [LeftCenterBtn setBackgroundColor:[UIColor clearColor]];
    [LeftCenterBtn addTarget:self action:@selector(LeftCenterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [LeftCenterView addSubview:LeftCenterBtn];
     
    
    UIView * RightCenterView = [[UIView alloc] init];
    RightCenterView.frame = CGRectMake(YYScreenWidth/2, 0, YYScreenWidth/4, 72);
    RightCenterView.backgroundColor = [UIColor clearColor];
    [self addSubview:RightCenterView];
    
    UIImageView * RightCenterImage = [[UIImageView alloc] init];
    RightCenterImage.backgroundColor = [UIColor clearColor];
    RightCenterImage.image = [UIImage imageNamed:@"MyCoupon"];
    RightCenterImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 24, 22);
    [RightCenterView addSubview:RightCenterImage];
   
    UILabel * RightCenterTitle = [[UILabel alloc]init];
    RightCenterTitle.text = @"我的卡券";
    RightCenterTitle.textColor = YY66Color;
    RightCenterTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    RightCenterTitle.textAlignment = NSTextAlignmentLeft;
    RightCenterTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [RightCenterView addSubview:RightCenterTitle];

    UIButton * RightCenterBtn = [[UIButton alloc]init];
    RightCenterBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [RightCenterBtn setBackgroundColor:[UIColor clearColor]];
    [RightCenterBtn addTarget:self action:@selector(RightCenterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [RightCenterView addSubview:RightCenterBtn];
    
    
    UIView * RightBGView = [[UIView alloc] init];
    RightBGView.frame = CGRectMake(YYScreenWidth * 0.75, 0, YYScreenWidth/4, 72);
    RightBGView.backgroundColor = [UIColor clearColor];
    [self addSubview:RightBGView];
    
    UIImageView * RightImage = [[UIImageView alloc] init];
    RightImage.backgroundColor = [UIColor clearColor];
    RightImage.image = [UIImage imageNamed:@"MyTeam"];
    RightImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 24, 22);
    [RightBGView addSubview:RightImage];
   
    UILabel * RightTitle = [[UILabel alloc]init];
    RightTitle.text = @"我的团队";
    RightTitle.textColor = YY66Color;
    RightTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    RightTitle.textAlignment = NSTextAlignmentLeft;
    RightTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [RightBGView addSubview:RightTitle];
    
    UIButton * RightBtn = [[UIButton alloc]init];
    RightBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [RightBtn setBackgroundColor:[UIColor clearColor]];
    [RightBtn addTarget:self action:@selector(RightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [RightBGView addSubview:RightBtn];
    
    
}


-(void)LeftButtonClick:(UIButton*)titleButton{
    
    self.LeftBtnBlockClick();
}

-(void)LeftCenterButtonClick:(UIButton*)titleButton{
    
    self.LeftCenterBtnBlockClick();
    
}

-(void)RightCenterButtonClick:(UIButton*)titleButton{
    
    self.RightCenterBtnBlockClick();
    
}

-(void)RightButtonClick:(UIButton*)titleButton{
    
    self.RightBtnBlockClick();
    
}


@end