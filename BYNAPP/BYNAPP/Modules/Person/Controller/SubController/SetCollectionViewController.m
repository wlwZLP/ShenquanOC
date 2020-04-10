//
//  SetCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "SetCollectionViewController.h"
#import "SetTopCollectionViewCell.h"
#import "SetMidCollectionViewCell.h"
#import "SetBottomCollectionViewCell.h"


@interface SetCollectionViewController ()

@end

@implementation SetCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[SetTopCollectionViewCell class] forCellWithReuseIdentifier:@"SetTopCollectionViewCell"];
    
    [self.collectionView registerClass:[SetMidCollectionViewCell class] forCellWithReuseIdentifier:@"SetMidCollectionViewCell"];
    
    [self.collectionView registerClass:[SetBottomCollectionViewCell class] forCellWithReuseIdentifier:@"SetBottomCollectionViewCell"];
  
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
        SetTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetTopCollectionViewCell" forIndexPath:indexPath];
        
        cell.TopHeadImgBtnBlockClick = ^{
            [self YYShowAlertViewTitle:@"1"];
        };
        
        cell.TopNameBtnBlockClick  = ^{
           [self YYShowAlertViewTitle:@"2"];
        };
        
        cell.TopPhoneBtnBlockClick  = ^{
            [self YYShowAlertViewTitle:@"3"];
        };
         
        return cell;
        
    }else if (indexPath.item ==1){
       
       SetMidCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetMidCollectionViewCell" forIndexPath:indexPath];
        
        cell.WeiChatImgBtnBlockClick  = ^{
            [self YYShowAlertViewTitle:@"1"];
        };
        
        cell.TaoBaoBtnBlockClick   = ^{
           [self YYShowAlertViewTitle:@"2"];
        };
        
        cell.AutuBtnBlockClick   = ^{
            [self YYShowAlertViewTitle:@"3"];
        };
               
        return cell;
        
        
    }else{
        
        
        SetBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetBottomCollectionViewCell" forIndexPath:indexPath];
                
        return cell;
        
        
    }
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.item == 0) {
          return CGSizeMake(YYScreenWidth , 257);
    }else if (indexPath.item == 1){
          return CGSizeMake(YYScreenWidth , 182);
    }else{
          return CGSizeMake(YYScreenWidth , 65);
    }

}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
        return (CGSize){YYScreenWidth,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth,0};
    
}


// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerId" forIndexPath:indexPath];
        
        if(headerView == nil){
            headerView = [[UICollectionReusableView alloc] init];
        }
        
        headerView.backgroundColor = YYBGColor;
     
        return headerView;
    
    }
    
    return nil;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(12, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 10;
}





@end