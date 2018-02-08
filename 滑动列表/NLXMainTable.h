//
//  NLXMainTable.h
//  滑动列表
//
//  Created by admin on 2018/2/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WIDTH   [UIScreen mainScreen].bounds.size.width

@interface NLXMainTable : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,assign)CGFloat lastOffX;
@end


typedef void(^ScrollOffx)(CGFloat x,NSInteger index);
@interface MainCell:UITableViewCell<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *codeLab;
@property(nonatomic,strong)UICollectionView *collectView;
@property(nonatomic,strong)NSDictionary *data;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong)ScrollOffx scrollOffx;
@property(nonatomic,strong)UIScrollView *scrollView;

@end


@interface ItemCell:UICollectionViewCell
@property(nonatomic,strong)UILabel *contentLab;

@end
