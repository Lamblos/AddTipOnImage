//
//  ViewController.m
//  AddTipOnImage
//
//  Created by Arvin on 14/12/31.
//  Copyright (c) 2014年 com.roroge. All rights reserved.
//

#import "ViewController.h"
#import "RGImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

-(void)setUp {
    RGImageView *rgImageView = [[RGImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    rgImageView.image = [UIImage imageNamed:@"testPic.jpg"];
    [self.view addSubview:rgImageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                               rgImageView.frame.origin.y + rgImageView.frame.size.height,
                                                               [UIScreen mainScreen].bounds.size.width,
                                                               40)];
    
    label.backgroundColor = [UIColor blackColor];
    label.text = @"Tap Me";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];

}

-(BOOL)prefersStatusBarHidden {
    return YES;
}
@end
