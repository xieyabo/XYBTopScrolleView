//
//  XYBPageViewVC.h
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/14.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYBScrollView.h"
NS_ASSUME_NONNULL_BEGIN

@interface XYBPageViewVC : UIViewController

@property (nonatomic , strong)NSArray *VCArr;

@property (nonatomic , strong)NSMutableArray *cacheArr;

@property (nonatomic , strong)XYBScrollView *scrollView;

- (void)initPageVCWithArr:(NSArray *)VCArr;

@end

NS_ASSUME_NONNULL_END
