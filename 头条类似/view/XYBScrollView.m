//
//  XYBScrollView.m
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/14.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import "XYBScrollView.h"
#import "XYBTopScrolleViewHeader.h"
@interface XYBScrollView()

@property (nonatomic , strong)UIButton *tempBtn;

@property (nonatomic , strong)UIView *lineView;

@end

@implementation XYBScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.scrollView];
        [self addSubview:self.lineView];
        [self addSubview:self.siftBtn];
        [self.scrollView addSubview:self.symbolView];
    }
    return self;
}

- (void)scrollViewSletecedBtn:(NSInteger)index
{
    UIButton *btn = (UIButton *)[self.scrollView viewWithTag:index+1000];
    btn.selected = YES;
    self.tempBtn.selected = NO;
    self.tempBtn = btn;
    self.symbolView.frame = CGRectMake(btn.frame.size.width/2-24+(btn.frame.size.width)*index, 36, 48, 4);
    [self moveSymbolviewWithIndex:index withWidth:btn.frame.size.width];
}

- (void)moveSymbolviewWithIndex:(NSInteger)index withWidth:(float)width
{
    float a = index*width+width;
    if (a>XYBfDeviceWidth) {
        self.scrollView.contentOffset = CGPointMake(a-XYBfDeviceWidth, 0);
    }else{
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
}

- (UIView *)symbolView
{
    if (!_symbolView) {
        _symbolView = [[UIView alloc]init];
        _symbolView.backgroundColor = XYBRGBACOLOR(76, 116, 240, 1);
        _symbolView.layer.cornerRadius = 2;
    }
    return _symbolView;
}

- (void)setTitleArr:(NSArray *)titleArr
{
    if (_titleArr != titleArr) {
        _titleArr = titleArr;
    }
    float withde = (XYBfDeviceWidth-100)/titleArr.count;
    for (NSInteger i=0; i<titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:XYBRGBACOLOR(156, 156, 156, 1) forState:UIControlStateNormal];
        [btn setTitleColor:XYBRGBACOLOR(42, 42, 42, 1) forState:UIControlStateSelected];
        btn.frame = CGRectMake(withde*i, 0, withde, self.frame.size.height-1);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = 1000+i;
        if (i==0) {
            btn.selected = YES;
            self.symbolView.frame = CGRectMake(withde/2-24, 36, 48, 4);
            self.tempBtn = btn;
        }else{
            btn.selected = NO;
        }
        [self.scrollView addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setNoSiftTitleArr:(NSArray *)noSiftTitleArr
{
    if (_noSiftTitleArr != noSiftTitleArr) {
        _noSiftTitleArr = noSiftTitleArr;
    }
    self.siftBtn.hidden = YES;
    float withde = XYBfDeviceWidth/noSiftTitleArr.count;
    for (NSInteger i=0; i<noSiftTitleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:noSiftTitleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:XYBRGBACOLOR(42, 42, 42, 1) forState:UIControlStateNormal];
        [btn setTitleColor:XYBRGBACOLOR(76 , 116, 240, 1) forState:UIControlStateSelected];
        btn.frame = CGRectMake(withde*i, 0, withde, self.frame.size.height-1);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = 1000+i;
        if (i==0) {
            btn.selected = YES;
            self.symbolView.frame = CGRectMake(withde/2-24, 36, 48, 4);
            self.tempBtn = btn;
        }else{
            btn.selected = NO;
        }
        [self.scrollView addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setMoreTitleArr:(NSArray *)moreTitleArr
{
    if (_moreTitleArr != moreTitleArr) {
        _moreTitleArr = moreTitleArr;
    }
    self.siftBtn.hidden = YES;
    float withde = XYBfDeviceWidth/moreTitleArr.count;
    if (withde<60) {
        withde = 60;
    }
    self.scrollView.contentSize = CGSizeMake(withde*moreTitleArr.count, 0);
    for (NSInteger i=0; i<moreTitleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:moreTitleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:XYBRGBACOLOR(42, 42, 42, 1) forState:UIControlStateNormal];
        [btn setTitleColor:XYBRGBACOLOR(76 , 116, 240, 1) forState:UIControlStateSelected];
        btn.frame = CGRectMake(withde*i, 0, withde, self.frame.size.height-1);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = 1000+i;
        if (i==0) {
            btn.selected = YES;
            self.symbolView.frame = CGRectMake(withde/2-24, 36, 48, 4);
            self.tempBtn = btn;
        }else{
            btn.selected = NO;
        }
        [self.scrollView addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnClick:(UIButton *)btn
{
    if (btn == self.tempBtn) {
        return;
    }
    btn.selected = !btn.selected;
    self.tempBtn.selected = NO;
    self.tempBtn = btn;
    self.symbolView.frame = CGRectMake(btn.frame.size.width/2-24+(btn.frame.size.width)*(btn.tag-1000), 36, 48, 4);
    if (self.selectedBlock) {
        self.selectedBlock(btn.tag-1000);
    }
    [self moveSymbolviewWithIndex:btn.tag-1000 withWidth:btn.frame.size.width];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, XYBfDeviceWidth, 1)];
        _lineView.backgroundColor = XYBRGBACOLOR(220, 220, 220, 1);
    }
    return _lineView;
}

- (UIButton *)siftBtn
{
    if (!_siftBtn) {
        _siftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _siftBtn.frame = CGRectMake(XYBfDeviceWidth-100, 0, 100, self.frame.size.height);
        [_siftBtn setTitle:@"筛选" forState:UIControlStateNormal];
        [_siftBtn setTitleColor:XYBRGBACOLOR(42, 42, 42, 1) forState:UIControlStateNormal];
        [_siftBtn setImage:[UIImage imageNamed:@"筛选"] forState:UIControlStateNormal];
        [_siftBtn setImage:[UIImage imageNamed:@"筛选"] forState:UIControlStateNormal];
        [_siftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [_siftBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 25, 10, 55)];
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 10, 1, self.frame.size.height-20)];
        line.backgroundColor = XYBRGBACOLOR(220, 220, 220, 1);
        [_siftBtn addSubview:line];
    }
    return _siftBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
