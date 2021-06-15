//
//  XYBScrollView.h
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/14.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SrollViewBlock)(NSInteger index);

@interface XYBScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic , strong)UIScrollView *scrollView;

@property (nonatomic , strong)NSArray *titleArr;

@property (nonatomic , strong)NSArray *noSiftTitleArr;
@property (nonatomic , strong)NSArray *moreTitleArr;

@property (nonatomic , copy)SrollViewBlock selectedBlock;

@property (nonatomic , strong)UIButton *siftBtn;

@property (nonatomic , strong)UIView *symbolView;

- (void)scrollViewSletecedBtn:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
