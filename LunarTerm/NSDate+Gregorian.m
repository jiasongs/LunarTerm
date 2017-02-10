//
//  NSDate+Gregorian.m
//  LunarDate
//
//  Created by wbitos on 2017/2/8.
//  Copyright © 2017年 wbitos. All rights reserved.
//

#import "NSDate+Gregorian.h"

@implementation NSDate (Gregorian)
static NSCalendar      *_gregorianCalendar = nil;

+ (void)initialize {
    _gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
}

- (LTDate)getGregorianDate {
    @synchronized(_gregorianCalendar) {
        NSDateComponents *comp = [_gregorianCalendar components:(NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitYear |
                                                                 NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitSecond | NSCalendarUnitWeekday)
                                                       fromDate:self];
        LTDate gDate = (LTDate){(int)[comp year], [comp month], [comp day]};
        return gDate;
    }
}

- (NSDate *)getDatePart {
    @synchronized(_gregorianCalendar) {
        NSDateComponents *comp = [_gregorianCalendar components:(NSCalendarUnitYear   |
                                                                 NSCalendarUnitMonth  |
                                                                 NSCalendarUnitDay    ) fromDate:self];
        [comp setHour:0];
        [comp setMinute:0];
        [comp setSecond:0];
        NSDate *date = [_gregorianCalendar dateFromComponents:comp];
        return date;
    }
}

+ (NSDate *)dateFromCFGregorianDate:(LTDate)info {
    @synchronized(_gregorianCalendar) {
        NSDateComponents *comp = [_gregorianCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:[NSDate date]];
        
        [comp setDay:info.day];
        [comp setMonth:info.month];
        [comp setYear:info.year];
        [comp setHour:0];
        [comp setMinute:0];
        [comp setSecond:0];
        return [_gregorianCalendar dateFromComponents:comp];
    }
}
@end
