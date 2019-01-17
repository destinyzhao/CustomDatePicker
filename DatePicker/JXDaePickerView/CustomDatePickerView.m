//
//  CustomDatePickerView.m
//  DatePicker
//
//  Created by Destiny on 2019/1/17.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "CustomDatePickerView.h"
#import "DDatePicker.h"

@interface CustomDatePickerView ()

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLC;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) DDatePicker *datePicker;
@property (strong, nonatomic) DDatePicker *timePicker;

@property (copy, nonatomic) NSString *dateStr;
@property (copy, nonatomic) NSString *timeStr;

@end

@implementation CustomDatePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)loadXibView
{
    CustomDatePickerView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    view.frame = [[UIScreen mainScreen] bounds];
    
    return view;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}


- (IBAction)dateAction:(UIButton *)sender {
    
    self.timePicker.hidden = YES;
    self.dateButton.selected = YES;
    self.timeButton.selected = NO;
    self.leftLC.constant = 30;
}

- (IBAction)timeAction:(UIButton *)sender {
    
    [self createTimePicker];
    self.timePicker.hidden = NO;
    
    self.dateButton.selected = NO;
    self.timeButton.selected = YES;
    self.leftLC.constant = 92;
    
}

- (IBAction)okAction:(UIButton *)sender {
    [self dismiss];
}


- (void)tap:(UIGestureRecognizer *)gesture
{
    [self dismiss];
}

- (void)show
{
    self.dateButton.selected = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self createDatePicker];
}

-(void)dismiss {
    [self removeFromSuperview];
}

- (void)createDatePicker
{
    __weak typeof(self) weakSelf = self;
    if (!_datePicker) {
        _datePicker = [[DDatePicker alloc] initWithDateStyle:DateStyleShowYearMonthDay scrollToDate:[NSDate date] CompleteBlock:^(NSDate *selectDate) {
            weakSelf.dateStr = [selectDate stringWithFormat:@"yyyy-MM-dd"];
            NSLog(@"选择的日期：%@",weakSelf.dateStr);
        }];
        
        _datePicker.dateLabelColor = [UIColor blackColor];//年-月-日-时-分 颜色
        _datePicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
        _datePicker.maxLimitDate = [NSDate date];
        _datePicker.hideBackgroundYearLabel = YES;
        
        _datePicker.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 240);
        [self.backView addSubview:_datePicker];
    }
}

- (void)createTimePicker
{
    __weak typeof(self) weakSelf = self;
    if (!_timePicker) {
        _timePicker = [[DDatePicker alloc] initWithDateStyle:DateStyleShowHourMinute scrollToDate:[NSDate date] CompleteBlock:^(NSDate *selectDate) {
            weakSelf.timeStr = [selectDate stringWithFormat:@"HH:mm"];
            NSLog(@"选择的日期：%@",weakSelf.timeStr);
        }];
        
        _timePicker.dateLabelColor = [UIColor blackColor];//年-月-日-时-分 颜色
        _timePicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
        _timePicker.maxLimitDate = [NSDate date];
        _timePicker.hideBackgroundYearLabel = YES;
        
        _timePicker.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 240);
        [self.backView addSubview:_timePicker];
    }
}

@end
