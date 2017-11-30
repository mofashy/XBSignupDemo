//
//  XBSignupCell+Button.m
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#import "XBSignupCell+Button.h"

@implementation XBSignupCell (Button)

- (void)layoutButton {
    CGFloat width = CGRectGetWidth(self.frame);
    self.longButton.frame = CGRectMake(30, 7, width - 60, 50);
    if (self.cellType == XBCellTypeEmailButton) {
        self.label1.frame = CGRectMake(0, CGRectGetMaxY(self.longButton.frame) + 15, width, [self.label1 sizeThatFits:CGSizeZero].height);
        self.separator3.frame = CGRectMake(30, CGRectGetMaxY(self.label1.frame) + 10, width - 60, 1.0 / [UIScreen mainScreen].scale);
        self.label2.frame = CGRectMake(0, CGRectGetMaxY(self.separator3.frame) + 20, width, [self.label2 sizeThatFits:CGSizeZero].height);
        self.navigateButton.frame = CGRectMake((width - 120) / 2.0, CGRectGetMaxY(self.label2.frame), 120, 40);
    } else if (self.cellType == XBCellTypeLoginButton) {
        self.label1.frame = CGRectMake(0, CGRectGetMaxY(self.longButton.frame) + 15, width, [self.label1 sizeThatFits:CGSizeZero].height);
        self.resetButton.frame = CGRectMake((width - 120) / 2.0, CGRectGetMaxY(self.label1.frame), 120, 40);
        self.separator3.frame = CGRectMake(30, CGRectGetMaxY(self.resetButton.frame), width - 60, 1.0 / [UIScreen mainScreen].scale);
        self.label2.frame = CGRectMake(0, CGRectGetMaxY(self.separator3.frame) + 20, width, [self.label2 sizeThatFits:CGSizeZero].height);
        self.navigateButton.frame = CGRectMake((width - 120) / 2.0, CGRectGetMaxY(self.label2.frame), 120, 40);
    } else if (self.cellType == XBCellTypeSignupButton) {
        self.label1.frame = CGRectMake(0, CGRectGetMaxY(self.longButton.frame) + 15, width, [self.label1 sizeThatFits:CGSizeZero].height);
    }
}

- (CGFloat)heightForButton {
    if (self.cellType == XBCellTypeFacebookButton) {
        return 64;
    } else if (self.cellType == XBCellTypeEmailButton) {
        return 64 + 15 + [self.label1 sizeThatFits:CGSizeZero].height + 10 + 1.0 / [UIScreen mainScreen].scale + 20 + [self.label2 sizeThatFits:CGSizeZero].height + 40;
    } else if (self.cellType == XBCellTypeLoginButton) {
        return 64 + 15 + [self.label1 sizeThatFits:CGSizeZero].height + 40 + 1.0 / [UIScreen mainScreen].scale + 20 + [self.label2 sizeThatFits:CGSizeZero].height + 40;
    } else if (self.cellType == XBCellTypeSignupButton) {
        return 64 + 15 + [self.label1 sizeThatFits:CGSizeZero].height;
    }
    
    return 0;
}

@end
