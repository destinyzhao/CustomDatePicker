//
//  CustomDatePickerView.h
//  DatePicker
//
//  Created by Destiny on 2019/1/17.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedDateBlcok)(NSString *dateStr);

NS_ASSUME_NONNULL_BEGIN

@interface CustomDatePickerView : UIView

+ (instancetype)loadXibView;

@property (copy, nonatomic) SelectedDateBlcok block;

- (void)show;

@end

NS_ASSUME_NONNULL_END
