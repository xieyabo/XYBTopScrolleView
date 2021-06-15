//
//  UIViewController+Unitil.m
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/15.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import "UIViewController+Unitil.h"

static const NSString *VCSTRING_KEY = @"VCSTRING_KEY";
@implementation UIViewController (Unitil)

- (void)initDataWith:(NSInteger)index
{
    
}

- (void)refreshData
{
    
}

- (void)siftData
{
    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    objc_setAssociatedObject(self, &VCSTRING_KEY, [NSString stringWithFormat:@"%ld",selectedIndex], OBJC_ASSOCIATION_RETAIN);
}
- (NSInteger)selectedIndex
{
    return [objc_getAssociatedObject(self, &VCSTRING_KEY) integerValue];
}

@end
