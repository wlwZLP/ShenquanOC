//
//  YYHomeCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYHomeCollectionViewController.h"
#import "HomePlistModel.h"
#import "HomeMainCollectionViewController.h"
#import "HomeLikeCollectionViewController.h"
#import "HomeSearchCollectionViewController.h"
#import "MessageCollectionViewController.h"
#import "HomeSearchCollectionViewController.h"

static int const HomelabelWith = 90;

@interface YYHomeCollectionViewController ()<UISearchBarDelegate>

/** 用来存放所有文字的scrollView */
@property (nonatomic, strong) UIScrollView * titleScrollView;
/** 用来存放所有子控制器view的scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 标题下划线 */
@property (nonatomic, strong) UIView * titleUnderline;
/** 上一次点击的标题按钮 */
@property (nonatomic, strong) UIButton * previousClickedTitleButton;
/** 标题按钮数量 */
@property(nonatomic,strong)NSArray<HomePlistModel*> * HomeTitleModelArray;

/** 首页搜索空间 */
@property (nonatomic, strong) UISearchBar * HomeSearchBar;

/** 首页搜索背景UIView */
@property (nonatomic, strong) UIView * TopBarView;


@end

@implementation YYHomeCollectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self CreateHomeNavTopSearch];
    
    [self GetHomePlistDataCompleteData:^(NSArray<HomePlistModel *> *HomePlistArray) {
     
    
        [HomePlistArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             
            if (idx == 0) {
                
                 HomeMainCollectionViewController * OneVC = [[HomeMainCollectionViewController alloc]init];
                           
                 [self addChildViewController:OneVC];
                
             }else{
                 
                 HomeLikeCollectionViewController * OneVC = [[HomeLikeCollectionViewController alloc]init];
                  
                 OneVC.category_id = HomePlistArray[idx].Home_id;
    
                 [self addChildViewController:OneVC];
                
             }
     
          }];
       
         self.HomeTitleModelArray = HomePlistArray;
        
         [self CreateHomeBaseViewController];
        
    }];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
     [self.TopBarView setHidden:NO];
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [self.TopBarView setHidden:YES];
    
}


-(void)GetHomePlistDataCompleteData:(nullable void(^)(NSArray<HomePlistModel*> * HomePlistArray))CompleteData{
    

    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsCategories];
    
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
        
        NSDictionary * dict1 = @{@"id":@"000",@"name":@"首页"};
        
        NSDictionary * dict2 = @{@"id":@"8888",@"name":@"猜你喜欢"};
        
        NSArray * DataArray = EncodeArrayFromDic(responseObject, @"data");
        
        NSMutableArray * TitleArray = [NSMutableArray array];
        
        [TitleArray addObject:dict1];
        
        [TitleArray addObject:dict2];
        
        [TitleArray addObjectsFromArray:DataArray];
        
        CompleteData([NSArray modelArrayWithClass:[HomePlistModel class] json:TitleArray]);
        
        
    } failure:^(NSError *error, id responseCache) {
    
        NSDictionary * dict1 = @{@"id":@"000",@"name":@"首页"};
                
        NSDictionary * dict2 = @{@"id":@"8888",@"name":@"猜你喜欢"};
        
        NSArray * DataArray = EncodeArrayFromDic(responseCache, @"data");
        
        NSMutableArray * TitleArray = [NSMutableArray array];
        
        [TitleArray addObject:dict1];
        
        [TitleArray addObject:dict2];
        
        [TitleArray addObjectsFromArray:DataArray];
              
        CompleteData([NSArray modelArrayWithClass:[HomePlistModel class] json:DataArray]);
        
        
    }];
    
    
}


#pragma mark 视图控制器的生命周期

-(void)CreateHomeNavTopSearch{
    
//   [UIApplication sharedApplication].windowScene.statusBarManager.size.height
    
    UIView * TopBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YYScreenWidth, YYBarHeight)];
    TopBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:TopBarView];
    self.TopBarView = TopBarView;
    
    //添加搜索控价
    [TopBarView addSubview:self.HomeSearchBar];
    
    UIButton * SearchBtn = [[UIButton alloc] initWithFrame:CGRectMake(YYScreenWidth - 125, YYStatusHeight + 6 , 66, 32)];
    [SearchBtn addTarget:self action:@selector(SearchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    SearchBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    SearchBtn.backgroundColor = YYHexColor(@"#FFD409");
    [SearchBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [SearchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [SearchBtn.titleLabel setFont :[ UIFont fontWithName :@"Helvetica-Bold" size : 15]];
    [TopBarView addSubview:SearchBtn];
    [YYTools ChangeView:SearchBtn RadiusSize:16 BorderColor:YYHexColor(@"#FFD409")];
    
    UIButton * HomeRightBtn = [[UIButton alloc]init];
    [HomeRightBtn setBackgroundImage:[UIImage imageNamed:@"HomeMes"] forState:UIControlStateNormal];
    HomeRightBtn.frame = CGRectMake(YYScreenWidth - 40 , YYStatusHeight + 10, 26, 24);
    [HomeRightBtn addTarget:self action:@selector(RightMessBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:HomeRightBtn];
    
    
}



#pragma mark 点击头部搜索 消息按钮
-(void)SearchButtonClick{
     
    
    
    
}



-(void)RightMessBtnClick{
    
    MessageCollectionViewController * MesVC = [[MessageCollectionViewController alloc]init];
    MesVC.title = @"消息";
    [self.navigationController pushViewController:MesVC animated:YES];
    
}




/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (UISearchBar *)HomeSearchBar{
    
    if (_HomeSearchBar== nil) {
        
       _HomeSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, YYStatusHeight + 6 , YYScreenWidth - 100 , 32)];
       _HomeSearchBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
       _HomeSearchBar.showsCancelButton = NO;
       _HomeSearchBar.tintColor = [UIColor orangeColor];
       _HomeSearchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
       _HomeSearchBar.placeholder = @"粘贴标题，搜索优惠";
       _HomeSearchBar.delegate = self;
       _HomeSearchBar.searchBarStyle  = UISearchBarStyleProminent;
        [YYTools ChangeView:_HomeSearchBar RadiusSize:10 BorderColor:YYHexColor(@"#FFD409")];
        UITextField *textField = _HomeSearchBar.BYNGetSearchTextFiled;
        textField.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10 , 17 , 17)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:@"HomeSearch"];
        textField.leftView = imageView;
        NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName:YY99Color,NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        textField.attributedPlaceholder = arrStr;
        
    }
    
    return _HomeSearchBar;

}


#pragma mark - UISearchBardelegete
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    HomeSearchCollectionViewController * Search = [[HomeSearchCollectionViewController alloc]init];
    [self.navigationController pushViewController:Search animated:YES];
    return NO;
    
}



#pragma mark 创建头部滑动视图

-(void)CreateHomeBaseViewController{
    // 标题栏
    [self setupTitlesView];
    // 添加下划线的
    [self setupTitleUnderline];
    // scrollView
    [self setupScrollView];
    // 添加第0个子控制器的view
    [self addChildVcViewIntoScrollView:0];
   
}

/**
 *  标题栏
 */
- (void)setupTitlesView{
    
    // 文字
    UIScrollView * TitlescrollView = [[UIScrollView alloc] init];
    TitlescrollView.backgroundColor = [UIColor whiteColor];
    TitlescrollView.frame = CGRectMake(0, YYBarHeight, YYScreenWidth, 40);
    TitlescrollView.showsHorizontalScrollIndicator = NO;
    TitlescrollView.showsVerticalScrollIndicator = NO;
    TitlescrollView.pagingEnabled = YES;
    TitlescrollView.bounces = YES;
    TitlescrollView.scrollsToTop = YES;
    [self.view addSubview:TitlescrollView];
    self.titleScrollView = TitlescrollView;
    
    // 标题栏按钮
    [self setupTitleButtons];

}

/**
 *  标题下划线
 */
- (void)setupTitleUnderline
{
    // 标题按钮
    UIButton * firstTitleButton = self.titleScrollView.subviews.firstObject;
    // 下划线
    UIView *titleUnderline = [[UIView alloc] init];
    titleUnderline.ZLP_height = 3;
    titleUnderline.ZLP_y = self.titleScrollView.ZLP_height - titleUnderline.ZLP_height- 3;
    titleUnderline.backgroundColor = YYHexColor(@"#FFD409");
    [self.titleScrollView addSubview:titleUnderline];
    self.titleUnderline = titleUnderline;
    
    // 切换按钮状态
    firstTitleButton.selected = YES;
    firstTitleButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:2];
    self.previousClickedTitleButton = firstTitleButton;
    
    [firstTitleButton.titleLabel sizeToFit]; // 让label根据文字内容计算尺寸
    self.titleUnderline.ZLP_width = firstTitleButton.titleLabel.ZLP_width;
    self.titleUnderline.ZLP_centerX = firstTitleButton.ZLP_centerX;
    
    
}


/**
 *  scrollView
 */
- (void)setupScrollView
{
    
    // 不允许自动修改UIScrollView的内边距
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = YYBGColor;
    scrollView.frame = CGRectMake(0, YYBarHeight + 40, YYScreenWidth, YYScreenHeight  - YYBarHeight - YYTabBarHeight - 40 );
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = YES;
    scrollView.scrollsToTop = YES;
    // 点击状态栏的时候，这个scrollView不会滚动到最顶部
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 添加子控制器的view
    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollViewW = scrollView.ZLP_width;
    scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
    
}



/**
 *  标题栏按钮
 */
- (void)setupTitleButtons{
    
    NSUInteger count = self.HomeTitleModelArray.count;
    
    //设置标题滚动条
    self.titleScrollView.contentSize = CGSizeMake(count * HomelabelWith, 0);
    
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    // 标题按钮的尺寸
    CGFloat titleButtonW = HomelabelWith;
    
    CGFloat titleButtonH = 22;
    //每行间距
    CGFloat rowMargin = 0;
    
    // 创建3个标题按钮
    for (NSUInteger i = 0; i < count; i++) {
        
        CGFloat X =  i * titleButtonW + rowMargin*(i + 1) ;
        UIButton *titleButton = [[UIButton alloc]init];
        if (i == 1) {
           [titleButton setTitleColor:YYHexColor(@"#FB5434") forState:UIControlStateSelected];
        }else{
           [titleButton setTitleColor:YY22Color forState:UIControlStateSelected];
        }
        [titleButton setTitleColor:YY66Color forState:UIControlStateNormal];
        titleButton.titleLabel.hidden = YES;
        // frame
        titleButton.frame = CGRectMake(X , 10, titleButtonW, titleButtonH);
        [titleButton setAdjustsImageWhenHighlighted:NO];
        titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        titleButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.layer.masksToBounds = YES;
        titleButton.layer.cornerRadius = 10;
        [self.titleScrollView addSubview:titleButton];
        [titleButton setTitle:self.HomeTitleModelArray[i].name forState:UIControlStateNormal];
    
    }
    
    
    
}



#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 求出标题按钮的索引
    NSUInteger index = scrollView.contentOffset.x / scrollView.ZLP_width;
    // 点击对应的标题按钮
    UIButton * titleButton = self.titleScrollView.subviews[index];
    
    [self titleButtonClick:titleButton];
    
}


#pragma mark - titbuttonclick

-(void)titleButtonClick:(UIButton*)titleButton{
    
    // 切换按钮状态
    self.previousClickedTitleButton.selected = NO;
    self.previousClickedTitleButton.titleLabel.font =[UIFont systemFontOfSize:14];
    titleButton.selected = YES;
    self.previousClickedTitleButton = titleButton;
    titleButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:2];

    NSUInteger index = titleButton.tag;

    [UIView animateWithDuration:0.25 animations:^{
        // 滚动scrollView
        self.titleUnderline.ZLP_width = titleButton.titleLabel.ZLP_width + 10;
        self.titleUnderline.ZLP_centerX = titleButton.ZLP_centerX;
        CGFloat offsetX = self.scrollView.ZLP_width * index;
        int RowCount =  YYScreenWidth / HomelabelWith /2 ;
        
        if (index > RowCount) {
            
           self.titleScrollView.contentOffset = CGPointMake(HomelabelWith * (index -  1), 0);
            
         }else{
            
           
         }
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y);
        
      
    } completion:^(BOOL finished) {
        // 添加子控制器的view
        [self addChildVcViewIntoScrollView:index];
        
    }];
  
    // 设置index位置对应的tableView.scrollsToTop = YES， 其他都设置为NO
    for (NSUInteger i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *childVc = self.childViewControllers[i];
        // 如果view还没有被创建，就不用去处理
        if (!childVc.isViewLoaded) continue;
        UIScrollView *scrollView = (UIScrollView *)childVc.view;
        if (![scrollView isKindOfClass:[UIScrollView class]]) continue;
        scrollView.scrollsToTop = (i == index);
        
    }
    
    
}

/**
 *  添加第index个子控制器的view到scrollView中
 */
- (void)addChildVcViewIntoScrollView:(NSUInteger)index{
    
    UIViewController * childVc = self.childViewControllers[index];
    
    // 如果view已经被加载过，就直接返回
    if (childVc.isViewLoaded) return;
    
    // 取出index位置对应的子控制器view
    UIView *childVcView = childVc.view;
    
    // 设置子控制器view的frame
    CGFloat scrollViewW = self.scrollView.ZLP_width;
    childVcView.frame = CGRectMake(index * scrollViewW, 0, scrollViewW, self.scrollView.ZLP_height);
    // 添加子控制器的view到scrollView中
    [self.scrollView addSubview:childVcView];
    
    
}




@end
