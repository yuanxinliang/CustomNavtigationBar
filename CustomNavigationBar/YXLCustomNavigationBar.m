//
//  YXLCustomNavigationBar.m
//  CustomNavigationBar
//
//  Created by 袁鑫亮 on 2017/9/9.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "YXLCustomNavigationBar.h"

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface YXLCustomNavigationBar() {
    UIButton *leftBtn;
    UILabel *titleLabel;
    UIButton *rightBtn;
    UIView *bottomLine;
}

@end

@implementation YXLCustomNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    CGRect newFrame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    if ([super initWithFrame:newFrame]) {
        [self initNavigationBarWithFrame:newFrame];
    }
    return self;
}

- (void)initNavigationBarWithFrame:(CGRect)frame {
    CGFloat spacing = 5;
    CGFloat y = 20.0f;
    CGFloat height = 44;
    CGFloat btn_width = 44;
    CGFloat label_width = SCREEN_WIDTH - (spacing * 4 + btn_width * 2);
    leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(spacing, y, btn_width, height)];
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing * 2 + btn_width, y, label_width, height)];
    rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spacing - btn_width, y, btn_width, height)];
    bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5)];
    bottomLine.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:199.0/255.0 blue:204.0/255.0 alpha:1.0];
    bottomLine.hidden = YES;
    [self addSubview:leftBtn];
    [self addSubview:titleLabel];
    [self addSubview:rightBtn];
    [self addSubview:bottomLine];
}

- (void)setLeftImageName:(NSString *)leftImageName {
    [leftBtn setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
}

- (void)setRightImageName:(NSString *)rightImageName {
    [rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title {
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setTitleColor:(UIColor *)titleColor {
    titleLabel.textColor = titleColor;
}

- (void)setHiddenLine:(BOOL)hiddenLine {
    bottomLine.hidden = hiddenLine;
}

@end
