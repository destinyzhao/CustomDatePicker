//
//  ViewController.m
//  DatePicker
//
//  Created by Destiny on 2019/1/17.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "CustomDatePickerView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnAction:(UIButton *)sender {
    
    CustomDatePickerView *view = [CustomDatePickerView loadXibView];
    [view show];
}

@end
