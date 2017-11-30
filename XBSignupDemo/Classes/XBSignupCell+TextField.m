//
//  XBSignupCell+TextField.m
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#import "XBSignupCell+TextField.h"

@implementation XBSignupCell (Textfield)

- (void)layoutTextField {
    self.textField.frame = CGRectMake(30, 7, CGRectGetWidth(self.frame) - 60, 50);
}

- (CGFloat)heightForTextField {
    return 64;
}

@end
