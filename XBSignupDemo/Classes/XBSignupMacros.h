//
//  XBSignupMacros.h
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#ifndef XBSignupMacros_h
#define XBSignupMacros_h

#define XBHEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]

typedef NS_ENUM(NSUInteger, XBAuthType) {
    XBAuthTypeDefault,
    XBAuthTypeLogin,
    XBAuthTypeSignup,
};

typedef NS_ENUM(NSUInteger, XBCellType) {
    XBCellTypeHeadline = 0,
    XBCellTypeEmailTextField,
    XBCellTypeNameTextField,
    XBCellTypePasswordTextField,
    XBCellTypeLoginButton,
    XBCellTypeSeparator,
    XBCellTypeFacebookButton,
    XBCellTypeEmailButton,
    XBCellTypeSignupButton,
};

#endif /* XBSignupMacros_h */
