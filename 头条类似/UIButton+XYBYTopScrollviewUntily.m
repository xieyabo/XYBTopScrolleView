//
//  UIButton+XYBYTopScrollviewUntily.m
//  time
//
//  Created by 杭州帮聚 on 2021/6/15.
//

#import "UIButton+XYBYTopScrollviewUntily.h"
static const void *topscrolleasssociateKey = @"xybtopscrollebtnclickasssociateKey";
@implementation UIButton (XYBYTopScrollviewUntily)
- (void)btnAddAction:(void(^)(void))click
{
    void(^action)(void) = objc_getAssociatedObject(self, topscrolleasssociateKey);
    if (action==nil) {
        objc_setAssociatedObject(self, topscrolleasssociateKey, click, OBJC_ASSOCIATION_RETAIN);
        [self addTarget:self action:@selector(btnAddClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnAddClick
{
    void(^action)(void) = objc_getAssociatedObject(self, topscrolleasssociateKey);
    if (action) {
        action();
    }
}

@end
