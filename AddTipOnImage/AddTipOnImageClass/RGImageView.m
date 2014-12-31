//
//  RGImageView.m
//  AddTipOnImage
//
//  Created by Arvin on 14/12/31.
//  Copyright (c) 2014年 com.roroge. All rights reserved.
//

#import "RGImageView.h"

@interface RGImageView()<UITextViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) UITextView *tip;
@property (assign, nonatomic) CGPoint beginPoint;
@end

@implementation RGImageView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *imageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTaped)];
        [self addGestureRecognizer:imageViewTap];
        imageViewTap.delegate = self;
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

-(void)imageViewTaped {
    [self initTip];
}

-(void)initTip {
    CGRect frame = CGRectMake(20, 20, 50, 20);
    self.tip = [[UITextView alloc] initWithFrame:frame];
    self.tip.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5];
    self.tip.textColor = [UIColor whiteColor];
    self.tip.delegate = self;
    [self addSubview:self.tip];
}

@end
