//
//  ViewController.m
//  AddTipOnImage
//
//  Created by Arvin on 14/12/31.
//  Copyright (c) 2014年 com.roroge. All rights reserved.
//

#import "ViewController.h"
#import "RGImageView.h"

#define InputDefault   @"输入内容，尽情吐槽吧"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) NSString *tipContent;
@property (strong, nonatomic) RGImageView *rgImageView;
@property (strong, nonatomic) UITextField *inputTextField;
@property (strong, nonatomic) UIButton *tip;
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
    
    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 230, 300, 40)];
    self.inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputTextField.layer.borderColor = [UIColor blackColor].CGColor;
    self.inputTextField.placeholder = InputDefault;
    self.inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.inputTextField.returnKeyType = UIReturnKeySend;
    self.inputTextField.delegate = self;
    [self.view addSubview:self.inputTextField];

}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = @"";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self addTip:textField.text];
    [self keyboardWillHide];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self keyboardWillHide];
    self.inputTextField.text = InputDefault;
}

-(void)addTip:(NSString *)content {
    self.tip = [[UIButton alloc] initWithFrame:CGRectMake(70, 120, 40, 20)];
    self.tip.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5];
    [self.tip setTitle:content forState:UIControlStateNormal];
    self.tip.titleLabel.textColor = [UIColor whiteColor];
    
    UIPanGestureRecognizer *dragTip = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.tip addGestureRecognizer:dragTip];

    [self.rgImageView addSubview:self.tip];

}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    self.tip.center = CGPointMake(self.tip.center.x + translation.x, self.tip.center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self.view];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)keyboardWillHide {
    [self.inputTextField resignFirstResponder];
}

@end
