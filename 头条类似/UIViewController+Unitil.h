//
//  UIViewController+Unitil.h
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/15.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Unitil)
{
    
}
@property (nonatomic, assign)NSInteger selectedIndex;

- (void)initDataWith:(NSInteger)index;
- (void)siftData;
- (void)refreshData;


@end

NS_ASSUME_NONNULL_END
