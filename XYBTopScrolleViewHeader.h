//
//  XYBTopScrolleViewHeader.h
//  time
//
//  Created by 杭州帮聚 on 2021/6/15.
//

#ifndef XYBTopScrolleViewHeader_h
#define XYBTopScrolleViewHeader_h


#define XYBfDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define XYBfDeviceHeight ([UIScreen mainScreen].bounds.size.height)

#define IS_IPHONE4                  (XYBfDeviceHeight < 568)
#define IS_IPHONE5                  (XYBfDeviceHeight == 568)
#define IS_IPHONE6                  (XYBfDeviceHeight == 667)
#define IS_IPHONE6P                 (XYBfDeviceHeight == 736)
#define IS_IPHONEx                  (XYBfDeviceHeight >= 812)
#define XYBFONT(x)         [UIFont systemFontOfSize:(IS_IPHONE6P?x+1:(IS_IPHONE5?x-2:x))]
#define XYBWS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define XYBCALW(width)                 (width/750.0*XYBfDeviceWidth)
#define XYBRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#endif /* XYBTopScrolleViewHeader_h */
