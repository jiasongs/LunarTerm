//
//  NSDate+Gregorian.h
//  LunarDate
//
//  Created by wbitos on 2017/2/8.
//  Copyright © 2017年 wbitos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTDate.h"

@interface NSDate (Gregorian)
- (LTDate)getGregorianDate;
- (NSDate *)getDatePart;
+ (NSDate *)dateFromCFGregorianDate:(LTDate)gDate;
@end
