//
//  XBSignupCell+Separator.m
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#import "XBSignupCell+Separator.h"

@implementation XBSignupCell (Separator)

- (void)layoutSeparator {
    self.orLabel.frame = CGRectMake((CGRectGetWidth(self.frame) - 30) / 2.0, 0, 30, 12);
    CGFloat y = CGRectGetHeight(self.frame) / 2.0;
    CGFloat width = CGRectGetMinX(self.orLabel.frame) - 30;
    CGFloat height = 1.0 / [UIScreen mainScreen].scale;
    self.separator1.frame = CGRectMake(30, y, width, height);
    self.separator2.frame = CGRectMake(CGRectGetMaxX(self.orLabel.frame), y, width, height);
}

- (CGFloat)heightForSeparator {
    return 20;
}

@end
