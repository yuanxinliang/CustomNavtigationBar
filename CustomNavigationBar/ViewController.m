//
//  ViewController.m
//  CustomNavigationBar
//
//  Created by 袁鑫亮 on 2017/9/9.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "YXLCustomNavigationBar.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) YXLCustomNavigationBar *yxl_navi;
@property (nonatomic, strong) UITableView *yxl_tv;
@property (nonatomic, strong) UIImageView *headerIV;

@end

static CGRect headerIVOriginalFrame;

@implementation ViewController

- (YXLCustomNavigationBar *)yxl_navi {
    if (!_yxl_navi) {
        _yxl_navi = [[YXLCustomNavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        [self.view addSubview:_yxl_navi];
    }
    return _yxl_navi;
}

- (UITableView *)yxl_tv {
    if (!_yxl_tv) {
        _yxl_tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _yxl_tv.backgroundColor = [UIColor clearColor];
        _yxl_tv.delegate = self;
        _yxl_tv.dataSource = self;
        [_yxl_tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
        [self.view addSubview:_yxl_tv];
    }
    return _yxl_tv;
}

- (UIImageView *)headerIV {
    if (!_headerIV) {
        _headerIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 0.625)];
        [self.view addSubview:_headerIV];
    }
    return _headerIV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.headerIV.image = [UIImage imageNamed:@"bg"];
    headerIVOriginalFrame = self.headerIV.frame;
    self.yxl_navi.title = @"CustomNavigationBar";
    self.yxl_navi.titleColor = [UIColor lightGrayColor];
    self.yxl_navi.leftImageName = @"left";
    self.yxl_navi.rightImageName = @"right";
    self.yxl_navi.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    UIView *tvHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    tvHeaderView.backgroundColor = [UIColor clearColor];
    self.yxl_tv.tableHeaderView = tvHeaderView;
    [self.yxl_tv reloadData];
    self.yxl_tv.showsVerticalScrollIndicator = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"test - %ld", indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset < 150) {
        self.yxl_navi.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:yOffset / 150];
        self.yxl_navi.titleColor = [UIColor lightGrayColor];
        self.yxl_navi.leftImageName = @"left";
        self.yxl_navi.rightImageName = @"right";
        self.yxl_navi.hiddenLine = YES;
    } else {
        self.yxl_navi.backgroundColor = [UIColor whiteColor];
        self.yxl_navi.titleColor = [UIColor colorWithRed:246.0/255.0 green:98.0/255.0 blue:87.0/255.0 alpha:1.0];;
        self.yxl_navi.leftImageName = @"left_normal";
        self.yxl_navi.rightImageName = @"right_normal";
        self.yxl_navi.hiddenLine = NO;
    }
    
    if (yOffset > 0) { // 往上移动
        self.headerIV.frame = ({
            CGRect frame = headerIVOriginalFrame;
            frame.origin.y = headerIVOriginalFrame.origin.y - yOffset;
            frame;
        });
        
    } else { // 往下移动
        self.headerIV.frame = ({
            CGRect frame = headerIVOriginalFrame;
            frame.size.height = headerIVOriginalFrame.size.height - yOffset;
            frame.size.width = frame.size.height / 0.625f;
            frame.origin.x = headerIVOriginalFrame.origin.x - (frame.size.width - headerIVOriginalFrame.size.width) / 2;
            frame;
        });
    }
}

@end
