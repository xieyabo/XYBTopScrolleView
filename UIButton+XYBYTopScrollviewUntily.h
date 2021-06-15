//
//  UIButton+XYBYTopScrollviewUntily.h
//  time
//
//  Created by 杭州帮聚 on 2021/6/15.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XYBYTopScrollviewUntily)

- (void)btnAddAction:(void(^)(void))click;

@end

NS_ASSUME_NONNULL_END
