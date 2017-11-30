//
//  XBSignupCell.h
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBSignupMacros.h"

@protocol XBSignupCellDelegate;

@interface XBSignupCell : UITableViewCell
// headline
@property (strong, nonatomic) UILabel *signupLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

// button
@property (strong, nonatomic) UIButton *longButton;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UIView *separator3;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UIButton *resetButton;
@property (strong, nonatomic) UIButton *navigateButton;

// textField
@property (strong, nonatomic) UITextField *textField;

// separator
@property (strong, nonatomic) UIView *separator1;
@property (strong, nonatomic) UILabel *orLabel;
@property (strong, nonatomic) UIView *separator2;

@property (assign, nonatomic) XBCellType cellType;
@property (weak, nonatomic) id <XBSignupCellDelegate> delegate;

- (CGFloat)heightForCell;
@end


@protocol XBSignupCellDelegate <NSObject>
- (void)navigateToLogin;
- (void)navigateToSignup;
@end
