//
//  NLXMainTable.m
//  滑动列表
//
//  Created by admin on 2018/2/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "NLXMainTable.h"

#define CELL_IDENTIFIER          @"mainCell"
#define CELL_ROWHEIGHT          44
@implementation NLXMainTable
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.tableView reloadData];
    }
    return self;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = CELL_ROWHEIGHT;
        [_tableView registerClass:[MainCell class] forCellReuseIdentifier:CELL_IDENTIFIER];
        _tableView.tableFooterView = [UIView new];
        [self addSubview:_tableView];
    }
    return _tableView;
}
- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] init];
        for (int i = 0; i<30; i++) {
             NSDictionary *dic = @{@"title":@"123",@"code":@"200010",@"new":@"11.26",@"add":@"6.33%",@"speed":@"0.26%",@"sum":@"64万",@"change":@"4.1%"};
            [_dataList addObject:dic];
        }
    }
   
    return _dataList;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    NSDictionary *data = _dataList[indexPath.row];
    cell.titleLab.text = data[@"title"];
    cell.codeLab.text = data[@"code"];
    cell.index = indexPath.row;
    cell.scrollView.contentOffset = CGPointMake(_lastOffX, 0);
    cell.scrollView.delegate = self;
    
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *cells = [self.tableView visibleCells];
    if ([scrollView isKindOfClass:[UITableView class]]) {
        for (MainCell *cell in cells) {
                cell.scrollView.delegate = self;
                cell.userInteractionEnabled = NO;
            
        }
   
    }else{
        for (MainCell *cell in cells) {
            if (cell.scrollView != scrollView) {
                cell.scrollView.delegate = nil;
                cell.userInteractionEnabled = NO;
                //            self.tableView.userInteractionEnabled = NO;
            }
            cell.scrollView.contentOffset = scrollView.contentOffset;
        }
    }
  
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSArray *cells = [self.tableView visibleCells];
    if ([scrollView isKindOfClass:[UITableView class]]) {
        for (MainCell *cell in cells) {
            cell.scrollView.delegate = self;
            cell.userInteractionEnabled = YES;
            
        }
    }else{
        _lastOffX = scrollView.contentOffset.x;
        for (MainCell *cell in cells) {
            cell.scrollView.delegate = self;
            cell.userInteractionEnabled = YES;
            
        }
    }
}
@end

@implementation MainCell

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, WIDTH/3-15, CELL_ROWHEIGHT/2)];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = [UIFont systemFontOfSize:14 weight:2];
        _titleLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}
- (UILabel *)codeLab
{
    if (!_codeLab) {
        _codeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, CELL_ROWHEIGHT/2, WIDTH/3-15, CELL_ROWHEIGHT/2)];
        _codeLab.textAlignment = NSTextAlignmentLeft;
        _codeLab.font = [UIFont systemFontOfSize:10 weight:1];
        _codeLab.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_codeLab];
    }
    return _codeLab;
}
-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3*2, 44)];
        for (int i = 0; i<10; i++) {
        UILabel*   codeLab = [[UILabel alloc] initWithFrame:CGRectMake(i*WIDTH/3, 0, WIDTH/3, CELL_ROWHEIGHT)];
            codeLab.textAlignment = NSTextAlignmentCenter;
            codeLab.font = [UIFont systemFontOfSize:10 weight:1];
            codeLab.textColor = [UIColor redColor];
            codeLab.text = @"100";
            [_scrollView addSubview:codeLab];
        }
        _scrollView.contentSize = CGSizeMake(WIDTH/3*10, CELL_ROWHEIGHT);
        [self.contentView addSubview:_scrollView];
    }
    return _scrollView;
}

- (UICollectionView *)collectView
{
    if (!_collectView) {
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
        [layOut setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3*2, 44) collectionViewLayout:layOut];
        _collectView.showsHorizontalScrollIndicator = NO;
        _collectView.showsVerticalScrollIndicator = NO;
        [_collectView registerClass:[ItemCell class] forCellWithReuseIdentifier:@"ItemCell"];
        
        
        _collectView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_collectView];
    }
    _collectView.dataSource = self;
    _collectView.delegate = self;
    return _collectView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    cell.contentLab.text = @"100";
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(WIDTH/3, CELL_ROWHEIGHT);
}
@end

@implementation ItemCell
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _contentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH/3, CELL_ROWHEIGHT)];
        _contentLab.textAlignment = 1;
        _contentLab.textColor = [UIColor redColor];
        _contentLab.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_contentLab];
    }
    return self;
}
@end
