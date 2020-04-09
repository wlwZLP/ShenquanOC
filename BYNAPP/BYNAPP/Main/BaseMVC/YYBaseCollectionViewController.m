//
//  YYCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBaseCollectionViewController.h"

@interface YYBaseCollectionViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation YYBaseCollectionViewController


static NSString * const reuseIdentifier = @"Cell";


-(instancetype)init{
    
     UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
     flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
     flowLayout.itemSize = CGSizeMake(YYScreenWidth, 50);
     return [super initWithCollectionViewLayout:flowLayout];
    
}


- (void)viewDidLoad {
    
      [super viewDidLoad];
    
      //是否显示返回按钮
      self.isShowLiftBack = YES;
    
      [self.navigationController setNavigationBarHidden:NO animated:nil];
    
      self.collectionView.backgroundColor = [UIColor whiteColor];
    
      self.ListDataArray = [NSMutableArray array];
    
      [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

      self.collectionView.emptyDataSetSource = self;
    
      self.collectionView.emptyDataSetDelegate = self;
    
}


- (void)setIsShowLiftBack:(BOOL)isShowLiftBack
{
    _isShowLiftBack = isShowLiftBack;
    
    NSInteger VCCount = self.navigationController.viewControllers.count;
    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
    if (isShowLiftBack && ( VCCount > 1 || self.navigationController.presentingViewController != nil)){
       
      self.navigationItem.leftBarButtonItem = [self itemWithimage:[UIImage imageNamed:@"LeftBack"] highImage:[UIImage imageNamed:@"LeftBack"] target:self action:@selector(LeftBackItemAction)];
      
    } else {
        
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem * NULLBar=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
        self.navigationItem.leftBarButtonItem = NULLBar;
    }
    
}

- (void)LeftBackItemAction {
    
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.ListDataArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     UICollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
     cell.backgroundColor = [UIColor blueColor];
    
     return cell;
    
}

#pragma mark <DZNEmptyDataSetSource>

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
     return [UIImage imageNamed:@"kongbai"];
    
}

#pragma mark <UIBarButtonItem>

-(UIBarButtonItem *)itemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
    
}


#pragma mark 一个信息提示跟新

-(void)YYShowAlertViewTitle:(NSString *)title{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:sure];
    [YYRootViewController presentViewController:alertVC animated:YES completion:nil];
    
}




@end
