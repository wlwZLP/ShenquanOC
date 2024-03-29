//
//  CollectCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CollectCollectionViewCell.h"

@interface CollectCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Mainimage;

@property (nonatomic, strong) UIImageView * Logoimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * CouponPriceLabel;


@end


@implementation CollectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}

- (void)setup{
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(12, 4, self.ZLP_width -24, self.ZLP_height -8);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(8, 8, 132.5, 82);
    Mainimage.image = [UIImage imageNamed:@"banner01"];
    [MainBGView addSubview:Mainimage];
    self.Mainimage = Mainimage;
    

    UIImageView * XuImage = [[UIImageView alloc] init];
    XuImage.backgroundColor = [UIColor clearColor];
    XuImage.frame = CGRectMake(152, 8 , 1 , 82);
    XuImage.image = [UIImage imageNamed:@"xuxian"];
    [MainBGView addSubview:XuImage];
   
    UIImageView * IconImage = [[UIImageView alloc] init];
    IconImage.backgroundColor = [UIColor clearColor];
    IconImage.frame = CGRectMake(165, 13, 18, 18);
    IconImage.image = [UIImage imageNamed:@"Jingdong"];
    [MainBGView addSubview:IconImage];
    self.Logoimage = IconImage;
    
   
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"      瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯";
    TitleLabel.numberOfLines = 2;
    TitleLabel.textColor = YY22Color;
    TitleLabel.frame = CGRectMake(165,11, MainBGView.ZLP_width - 170, 40);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:TitleLabel];
    self.TitleLabel = TitleLabel;
    TitleLabel.YYLineSpace = 3;
    [TitleLabel YYUpdateConstraints];
    
    
    UILabel * PriceLabel = [[UILabel alloc]init];
    PriceLabel.text = @"¥15.5";
    PriceLabel.textColor = YYHexColor(@"#FB5434");
    PriceLabel.frame = CGRectMake(165, 65, 150, 20);
    PriceLabel.textAlignment = NSTextAlignmentLeft;
    PriceLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainBGView addSubview:PriceLabel];
    self.CouponPriceLabel = PriceLabel;


}


-(void)setModel:(MyCollectModel *)Model{
    
     _Model = Model;
    
    [self.Mainimage sd_setImageWithURL:[NSURL URLWithString:Model.item_info_cover_image] placeholderImage:[UIImage imageNamed:@"bmht"]];
       
    [self.Logoimage sd_setImageWithURL:[NSURL URLWithString:Model.mall_icon] placeholderImage:[UIImage imageNamed:@"Jingdong"]];
    
    self.TitleLabel.text = [NSString stringWithFormat:@"     %@",Model.item_info_title];
    
    self.CouponPriceLabel.text = [NSString stringWithFormat:@"￥%@ ",Model.item_info_price];
  
       
    
    
}


@end
