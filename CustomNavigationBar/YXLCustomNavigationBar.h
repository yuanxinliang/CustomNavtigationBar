//
//  YXLCustomNavigationBar.h
//  CustomNavigationBar
//
//  Created by 袁鑫亮 on 2017/9/9.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXLCustomNavigationBar : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, copy) NSString *leftImageName;
@property (nonatomic, copy) NSString *rightImageName;
@property (nonatomic, assign) BOOL hiddenLine;

@end
