//
//  XYBPageViewVC.m
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/14.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import "XYBPageViewVC.h"
#import "XYBTopScrolleViewHeader.h"
#import "UIViewController+Unitil.h"
#import "UIButton+XYBYTopScrollviewUntily.h"
@interface XYBPageViewVC ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic , assign)NSInteger pageIndex;
@property (nonatomic , strong)UIPageViewController *pageVC;

@end

@implementation XYBPageViewVC

- (void)initPageVCWithArr:(NSArray *)VCArr
{
    if (VCArr.count==0) {
        return;
    }
    self.VCArr = VCArr;
    for (NSInteger i=0; i<self.VCArr.count; i++) {
        if (i==0) {
            UIViewController *vc = (UIViewController *)[self.VCArr firstObject];
            [vc initDataWith:0];
            [self.cacheArr addObject:@"1"];
        }else{
            [self.cacheArr addObject:@"0"];
        }
    }
    [self creatPageVC];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, XYBCALW(492), XYBfDeviceWidth, self.view.frame.size.height-XYBCALW(492));
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    XYBWS(weakSelf);
    self.scrollView.selectedBlock = ^(NSInteger index) {
        [weakSelf turnPageWithIndex:index];
    };
    UIViewController *vc = (UIViewController *)[self.VCArr objectAtIndex:self.pageIndex];
    __weak __typeof(&*vc)weakVC = vc;
    [self.scrollView.siftBtn btnAddAction:^{
        weakVC.selectedIndex = self.pageIndex;
        [[self.VCArr objectAtIndex:self.pageIndex] siftData];
    }];
}

- (void)turnPageWithIndex:(NSInteger)index
{
    UIViewController *vc = (UIViewController *)[self.VCArr objectAtIndex:index];
    if (vc == nil) {
        return;
    }
    if (index > self.pageIndex) {
        [self.pageVC setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
            
        }];
    }else{
        [self.pageVC setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
            
        }];
    }
    self.pageIndex = index;
    if ([[self.cacheArr objectAtIndex:index] intValue]==0) {
        [vc initDataWith:index];
        [self.cacheArr replaceObjectAtIndex:index withObject:@"1"];
    }
    [vc refreshData];
}

- (void)creatPageVC
{
    self.pageIndex = 0;
    self.pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageVC.delegate = self;
    self.pageVC.dataSource = self;
    [self.pageVC setViewControllers:@[[self.VCArr firstObject]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    
    self.pageVC.view.frame = CGRectMake(0, CGRectGetHeight(self.scrollView.frame), XYBfDeviceWidth, self.view.frame.size.height-self.scrollView.frame.size.height);
}
#pragma -- UIPageViewControllerDataSource
//向后滑
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.VCArr indexOfObject:viewController];
    if (index==0 || (index == NSNotFound)) {
        return nil;
    }
    index -- ;
    return [self.VCArr objectAtIndex:index];
}
//向前滑
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.VCArr indexOfObject:viewController];
    if (index == self.VCArr.count-1 || (index == NSNotFound)) {
        return nil;
    }
    index ++;
    return [self.VCArr objectAtIndex:index];
}

#pragma mark -- UIPageViewControllerDelegate
//将要滑动
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    UIViewController *nextVC = (UIViewController *)[pendingViewControllers firstObject];
    NSInteger index = [self.VCArr indexOfObject:nextVC];
    self.pageIndex = index;
    if ([[self.cacheArr objectAtIndex:index] intValue]==0) {
        [nextVC initDataWith:index];
        [self.cacheArr replaceObjectAtIndex:index withObject:@"1"];
    }
}
//结束滑动
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed) {
        [self.scrollView scrollViewSletecedBtn:self.pageIndex];
    }
}




- (void)AC_Back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (XYBScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[XYBScrollView alloc]initWithFrame:CGRectMake(0, 0, XYBfDeviceWidth, 40)];
    }
    return _scrollView;
}

- (NSMutableArray *)cacheArr
{
    if (!_cacheArr) {
        _cacheArr = [[NSMutableArray alloc]init];
    }
    return _cacheArr;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
