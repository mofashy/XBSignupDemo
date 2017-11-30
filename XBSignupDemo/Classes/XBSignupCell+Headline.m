//
//  XBSignupCell+Headline.m
//  XBSignupDemo
//
//  Created by macOS on 2017/9/22.
//  Copyright © 2017年 XB. All rights reserved.
//

#import "XBSignupCell+Headline.h"

@implementation XBSignupCell (Headline)

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self.contentView addSubview:self.signupLabel];
//        [self.contentView addSubview:self.descriptionLabel];
//    }
//    
//    return self;
//}

- (void)layoutHeadline {
    CGFloat width = CGRectGetWidth(self.frame);
    self.signupLabel.frame = CGRectMake(0, 0, width, [self.signupLabel sizeThatFits:CGSizeZero].height);
    self.descriptionLabel.frame = CGRectMake(0, CGRectGetHeight(self.signupLabel.frame) + 10, width, [self.descriptionLabel sizeThatFits:CGSizeZero].height);
}

- (CGFloat)heightForHeadline {
    return [self.signupLabel sizeThatFits:CGSizeZero].height + 10 + [self.descriptionLabel sizeThatFits:CGSizeZero].height + 40;
}

@end
