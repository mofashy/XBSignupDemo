//
//  XBSignupViewController.m
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#import "XBSignupViewController.h"
#import "XBSignupMacros.h"

#import "XBSignupCell.h"
#import "XBSignupCell+Button.h"
#import "XBSignupCell+Headline.h"
#import "XBSignupCell+TextField.h"
#import "XBSignupCell+Separator.h"

static NSString * reuseIdentifier = @"XBSignupCell";

@interface XBSignupViewController () <UITableViewDataSource, UITableViewDelegate, XBSignupCellDelegate>
@property (assign, nonatomic) XBAuthType authType;
@property (strong, nonatomic) NSArray *cellTypes;
@property (strong, nonatomic) UIVisualEffectView *blurView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *leftbutton;
@property (strong, nonatomic) UIButton *rightButton;
@end

@implementation XBSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cellTypes = [self cellTypesForAuthType:_authType];
    
    _blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    _blurView.frame = self.view.bounds;
    [self.view addSubview:_blurView];
    
    _leftbutton = [[UIButton alloc] init];
    [_leftbutton setTitle:@"Back" forState:UIControlStateNormal];
    [_leftbutton addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    _leftbutton.frame = CGRectMake(10, 20, 44, 30);
    [self.view addSubview:_leftbutton];
    
    _rightButton = [[UIButton alloc] init];
    [_rightButton setTitle:@"Skip" forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    _rightButton.frame = CGRectMake(CGRectGetMaxX(self.view.bounds) - 44 - 10, 20, 44, 30);
    [self.view addSubview:_rightButton];
    
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.frame = CGRectMake(0, 120, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 120);
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[XBSignupCell class] forCellReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XBSignupCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.cellType = [[self.cellTypes objectAtIndex:indexPath.row] integerValue];
    cell.delegate = self;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    XBSignupCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    cell.cellType = [[self.cellTypes objectAtIndex:indexPath.row] integerValue];
    
    return [cell heightForCell];
}

#pragma mark - XBSignupCellDelegate

- (void)navigateToLogin {
    if (self.authType == XBAuthTypeDefault) {
        NSIndexPath *delIndexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *delIndexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
        NSArray *delIndexPaths = @[delIndexPath1, delIndexPath2];
        
        NSIndexPath *addIndexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSIndexPath *addIndexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
        NSIndexPath *addIndexPath3 = [NSIndexPath indexPathForRow:3 inSection:0];
        NSIndexPath *addIndexPath4 = [NSIndexPath indexPathForRow:4 inSection:0];
        NSArray *addIndexPaths = @[addIndexPath1, addIndexPath2, addIndexPath3, addIndexPath4];
        
        self.authType = XBAuthTypeLogin;
        self.cellTypes = [self cellTypesForAuthType:self.authType];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:delIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView insertRowsAtIndexPaths:addIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    } else if (self.authType == XBAuthTypeLogin) {
        NSIndexPath *delIndexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *delIndexPath2 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSIndexPath *delIndexPath3 = [NSIndexPath indexPathForRow:4 inSection:0];
        NSArray *delIndexPaths = @[delIndexPath1, delIndexPath2, delIndexPath3];
        
        NSIndexPath *addIndexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSIndexPath *addIndexPath2 = [NSIndexPath indexPathForRow:3 inSection:0];
        NSArray *addIndexPaths = @[addIndexPath1, addIndexPath2];
        
        self.authType = XBAuthTypeSignup;
        self.cellTypes = [self cellTypesForAuthType:self.authType];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:delIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView insertRowsAtIndexPaths:addIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
}

#pragma mark - Action

- (void)leftAction:(UIButton *)sender {
    if (self.authType == XBAuthTypeLogin) {
        NSIndexPath *delIndexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *delIndexPath2 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSIndexPath *delIndexPath3 = [NSIndexPath indexPathForRow:2 inSection:0];
        NSIndexPath *delIndexPath4 = [NSIndexPath indexPathForRow:3 inSection:0];
        NSIndexPath *delIndexPath5 = [NSIndexPath indexPathForRow:4 inSection:0];
        NSArray *delIndexPaths = @[delIndexPath1, delIndexPath2, delIndexPath3, delIndexPath4, delIndexPath5];
        
        NSIndexPath *addIndexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *addIndexPath2 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSIndexPath *addIndexPath3 = [NSIndexPath indexPathForRow:2 inSection:0];
        NSArray *addIndexPaths = @[addIndexPath1, addIndexPath2, addIndexPath3];
        
        self.authType = XBAuthTypeDefault;
        self.cellTypes = [self cellTypesForAuthType:self.authType];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:delIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView insertRowsAtIndexPaths:addIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    } else if (self.authType == XBAuthTypeSignup) {
        NSIndexPath *delIndexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *delIndexPath2 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSIndexPath *delIndexPath3 = [NSIndexPath indexPathForRow:2 inSection:0];
        NSIndexPath *delIndexPath4 = [NSIndexPath indexPathForRow:3 inSection:0];
        NSArray *delIndexPaths = @[delIndexPath1, delIndexPath2, delIndexPath3, delIndexPath4];
        
        NSIndexPath *addIndexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *addIndexPath2 = [NSIndexPath indexPathForRow:1 inSection:0];
        NSIndexPath *addIndexPath3 = [NSIndexPath indexPathForRow:2 inSection:0];
        NSArray *addIndexPaths = @[addIndexPath1, addIndexPath2, addIndexPath3];
        
        self.authType = XBAuthTypeDefault;
        self.cellTypes = [self cellTypesForAuthType:self.authType];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:delIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView insertRowsAtIndexPaths:addIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
}

- (void)rightAction:(UIButton *)sender {
    
}

- (NSArray *)cellTypesForAuthType:(XBAuthType)authType {
    switch (authType) {
        case XBAuthTypeDefault:
            return @[@(XBCellTypeHeadline), @(XBCellTypeFacebookButton), @(XBCellTypeEmailButton)];
            break;
        case XBAuthTypeLogin:
            return @[@(XBCellTypeFacebookButton), @(XBCellTypeSeparator), @(XBCellTypeEmailTextField), @(XBCellTypePasswordTextField), @(XBCellTypeLoginButton)];
        case XBAuthTypeSignup:
            return @[@(XBCellTypeEmailTextField), @(XBCellTypeNameTextField), @(XBCellTypePasswordTextField), @(XBCellTypeSignupButton)];
            break;
    }
}

@end
