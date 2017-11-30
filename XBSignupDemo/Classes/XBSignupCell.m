//
//  XBSignupCell.m
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#import "XBSignupCell.h"
#import "XBSignupCell+Button.h"
#import "XBSignupCell+Headline.h"
#import "XBSignupCell+TextField.h"
#import "XBSignupCell+Separator.h"

@implementation XBSignupCell

#pragma mark - Life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.signupLabel];
        [self.contentView addSubview:self.descriptionLabel];
        
        [self.contentView addSubview:self.longButton];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.separator3];
        [self.contentView addSubview:self.navigateButton];
        [self.contentView addSubview:self.resetButton];
        
        [self.contentView addSubview:self.textField];
        
        [self.contentView addSubview:self.separator1];
        [self.contentView addSubview:self.separator2];
        [self.contentView addSubview:self.orLabel];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (self.cellType) {
        case XBCellTypeHeadline:
            [self layoutHeadline];
            break;
        case XBCellTypeFacebookButton:
        case XBCellTypeEmailButton:
        case XBCellTypeLoginButton:
        case XBCellTypeSignupButton:
            [self layoutButton];
            break;
        case XBCellTypeNameTextField:
        case XBCellTypeEmailTextField:
        case XBCellTypePasswordTextField:
            [self layoutTextField];
            break;
        case XBCellTypeSeparator:
            [self layoutSeparator];
            break;
    }
}

#pragma mark - Public

- (CGFloat)heightForCell {
    switch (self.cellType) {
        case XBCellTypeHeadline:
            return [self heightForHeadline];
        case XBCellTypeFacebookButton:
        case XBCellTypeEmailButton:
        case XBCellTypeLoginButton:
        case XBCellTypeSignupButton:
            return [self heightForButton];
        case XBCellTypeNameTextField:
        case XBCellTypeEmailTextField:
        case XBCellTypePasswordTextField:
            return [self heightForTextField];
        case XBCellTypeSeparator:
            return [self heightForSeparator];
    }
}

#pragma mark - Action

- (void)navigateAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(navigateToLogin)]) {
        [self.delegate navigateToLogin];
    }
}

#pragma mark - Getter

- (UILabel *)signupLabel {
    if (!_signupLabel) {
        _signupLabel = [[UILabel alloc] init];
        _signupLabel.textAlignment = NSTextAlignmentCenter;
        _signupLabel.text = @"Sign up";
        _signupLabel.font = [UIFont boldSystemFontOfSize:48];
        _signupLabel.textColor = [UIColor whiteColor];
    }
    
    return _signupLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.textAlignment = NSTextAlignmentCenter;
        _descriptionLabel.text = @"to discover all our tastehud\ntickling recipes and features.";
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.font = [UIFont systemFontOfSize:14];
        _descriptionLabel.textColor = [UIColor whiteColor];
    }
    
    return _descriptionLabel;
}

- (UIButton *)longButton {
    if (!_longButton) {
        _longButton = [[UIButton alloc] init];
        _longButton.layer.cornerRadius = 5.0;
        _longButton.layer.masksToBounds = YES;
    }
    
    return _longButton;
}

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.textColor = [UIColor whiteColor];
        _label1.textAlignment = NSTextAlignmentCenter;
        _label1.font = [UIFont systemFontOfSize:12];
    }
    
    return _label1;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        _label2.textColor = [UIColor whiteColor];
        _label2.textAlignment = NSTextAlignmentCenter;
        _label2.font = [UIFont systemFontOfSize:14];
    }
    
    return _label2;
}

- (UIView *)separator3 {
    if (!_separator3) {
        _separator3 = [[UIView alloc] init];
        _separator3.backgroundColor = [UIColor whiteColor];
    }
    
    return _separator3;
}

- (UIButton *)resetButton {
    if (!_resetButton) {
        _resetButton = [[UIButton alloc] init];
        [_resetButton setTitleColor:XBHEXCOLOR(0xFFC443) forState:UIControlStateNormal];
    }
    
    return _resetButton;
}

- (UIButton *)navigateButton {
    if (!_navigateButton) {
        _navigateButton = [[UIButton alloc] init];
        [_navigateButton setTitleColor:XBHEXCOLOR(0xFFC443) forState:UIControlStateNormal];
        [_navigateButton addTarget:self action:@selector(navigateAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _navigateButton;
}

- (UIView *)separator1 {
    if (!_separator1) {
        _separator1 = [[UIView alloc] init];
        _separator1.backgroundColor = [UIColor whiteColor];
    }
    
    return _separator1;
}

- (UIView *)separator2 {
    if (!_separator2) {
        _separator2 = [[UIView alloc] init];
        _separator2.backgroundColor = [UIColor whiteColor];
    }
    
    return _separator2;
}

- (UILabel *)orLabel {
    if (!_orLabel) {
        _orLabel = [[UILabel alloc] init];
        _orLabel.textColor = [UIColor whiteColor];
        _orLabel.textAlignment = NSTextAlignmentCenter;
        _orLabel.text = @"or";
        _orLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _orLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.cornerRadius = 5;
        _textField.layer.masksToBounds = YES;
        _textField.font = [UIFont systemFontOfSize:16];
        _textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        _textField.rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.rightViewMode = UITextFieldViewModeAlways;
    }
    
    return _textField;
}

#pragma mark - Setter

- (void)setCellType:(XBCellType)cellType {
    _cellType = cellType;
    
    self.signupLabel.hidden = cellType != XBCellTypeHeadline;
    self.descriptionLabel.hidden = cellType != XBCellTypeHeadline;
    
    self.longButton.hidden = cellType != XBCellTypeSignupButton && cellType != XBCellTypeLoginButton && cellType != XBCellTypeEmailButton && cellType != XBCellTypeFacebookButton;
    self.label1.hidden = self.longButton.isHidden;
    self.resetButton.hidden = cellType != XBCellTypeLoginButton;
    self.separator3.hidden = cellType != XBCellTypeLoginButton && cellType != XBCellTypeEmailButton;
    self.label2.hidden = self.separator3.isHidden;
    self.navigateButton.hidden = self.separator3.isHidden;
    
    self.textField.hidden = cellType != XBCellTypeNameTextField && cellType != XBCellTypeEmailTextField && cellType != XBCellTypePasswordTextField;
    
    self.separator1.hidden = cellType != XBCellTypeSeparator;
    self.separator2.hidden = cellType != XBCellTypeSeparator;
    self.orLabel.hidden = cellType != XBCellTypeSeparator;
    
    if (cellType == XBCellTypeEmailButton) {
        self.label1.text = @"By signing up i accept the terms and conditions";
        self.label2.text = @"Already have an account?";
        [self.longButton setTitle:@"E-mail" forState:UIControlStateNormal];
        [self.navigateButton setTitle:@"Log in here" forState:UIControlStateNormal];
        self.longButton.backgroundColor = XBHEXCOLOR(0xFFC443);
    } else if (cellType == XBCellTypeFacebookButton) {
        [self.longButton setTitle:@"Facebook" forState:UIControlStateNormal];
        self.longButton.backgroundColor = XBHEXCOLOR(0x375B97);
    } else if (cellType == XBCellTypeLoginButton) {
        self.label1.text = @"Forgot your password?";
        self.label2.text = @"No account yet?";
        [self.resetButton setTitle:@"Reset here" forState:UIControlStateNormal];
        [self.navigateButton setTitle:@"Sign up now!" forState:UIControlStateNormal];
        [self.longButton setTitle:@"Log in" forState:UIControlStateNormal];
        [self.navigateButton setTitle:@"Sign up now!" forState:UIControlStateNormal];
        self.longButton.backgroundColor = XBHEXCOLOR(0xFFC443);
    } else if (cellType == XBCellTypeSignupButton) {
        self.label1.text = @"By signing up I accept the terms and conditions";
        [self.longButton setTitle:@"Sign up" forState:UIControlStateNormal];
        self.longButton.backgroundColor = XBHEXCOLOR(0xFFC443);
    } else if (cellType == XBCellTypeEmailTextField) {
        self.textField.placeholder = @"E-mail";
        self.textField.secureTextEntry = NO;
    } else if (cellType == XBCellTypePasswordTextField) {
        self.textField.placeholder = @"Password (min. 6 characters)";
        self.textField.secureTextEntry = YES;
    } else if (cellType == XBCellTypeNameTextField) {
        self.textField.placeholder = @"Name";
        self.textField.secureTextEntry = NO;
    }
}

@end
