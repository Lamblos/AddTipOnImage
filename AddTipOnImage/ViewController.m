//
//  ViewController.m
//  AddTipOnImage
//
//  Created by Arvin on 14/12/31.
//  Copyright (c) 2014年 com.roroge. All rights reserved.
//

#import "ViewController.h"
#import "RGImageView.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) NSString *tipContent;
@property (strong, nonatomic) RGImageView *rgImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

-(void)setUp {
    self.rgImageView = [[RGImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 220)];
    self.rgImageView.image = [UIImage imageNamed:@"testPic.jpg"];
    [self.view addSubview:self.rgImageView];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,
//                                                               rgImageView.frame.origin.y + rgImageView.frame.size.height,
//                                                               [UIScreen mainScreen].bounds.size.width,
//                                                               40)];
//    
//    label.backgroundColor = [UIColor blackColor];
//    label.text = @"Tap Me";
//    label.textColor = [UIColor whiteColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 230, 300, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.layer.borderColor = [UIColor blackColor].CGColor;
    textField.placeholder = @"输入内容，尽情吐槽吧！";
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.returnKeyType = UIReturnKeySend;
    [self.view addSubview:textField];

}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = @"";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.tipContent = textField.text;
    [self addTip:self.tipContent];
    return YES;
}

-(void)addTip:(NSString *)content {
    [self initTip:self.tipContent];
}

-(void)initTip:(NSString *)title {
    UIButton *tip = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 20)];
    tip.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5];
    tip.titleLabel.text = title;
    [self.rgImageView addSubview:tip];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}
@end
