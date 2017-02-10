//
//  Festival.m
//  LunarDate
//
//  Created by wbitos on 11-8-11.
//  Copyright 2011年 wbitos. All rights reserved.
//

#import "Festival.h"
#import "NSDate+Gregorian.h"

@interface Festival ()
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *desc;
@property (nonatomic, assign, readwrite) LTDate    ltDate;
@property (nonatomic, assign, readwrite) BOOL      lunar;
@property (nonatomic, strong, readwrite) NSArray   *components;
@property (nonatomic, assign, readwrite) NSInteger fromYear;

@end

@implementation Festival
+ (void)initialize {

}

+ (int)getWeekday:(LTDate)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    CFTimeZoneRef tz = CFTimeZoneCopyDefault();
    CFGregorianDate month_date;
    month_date.year = date.year;
    month_date.month = date.month;
    month_date.day = date.day;
    month_date.hour = 0;
    month_date.minute = 0;
    month_date.second = 1;
    int weekday = (int)CFAbsoluteTimeGetDayOfWeek(CFGregorianDateGetAbsoluteTime(month_date,tz),tz);
    CFRelease(tz);
    return weekday;
}

+ (Festival *)festivalWithName:(NSString *)name desc:(NSString *)desc ltDate:(LTDate)ltDate lunar:(BOOL)lunar {
    Festival *f = [[Festival alloc] init];
    f.name = name;
    f.desc = desc;
    f.ltDate = ltDate;
    f.lunar = lunar;
    return f;
}

+ (NSArray *)solarFestivalWithDate:(NSDate *)date {
    LTDate gDate = [date getGregorianDate];
    return [self solarFestivalWithGDate:gDate];
}

+ (NSArray *)solarFestivalsWithGDate:(LTDate)ltDate {
    NSMutableArray *festivals = [NSMutableArray array];
    int monthDay = ltDate.month * 100 + ltDate.day;
    switch (monthDay) {
        case 101: {
            Festival *f = [Festival festivalWithName:@"元旦" desc:@"新年元旦" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        };
        case 214: {
            Festival *f = [Festival festivalWithName:@"情人节" desc:@"情人节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        };
        case 308: {
            Festival *f = [Festival festivalWithName:@"妇女节" desc:@"国际妇女节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 312: {
            Festival *f = [Festival festivalWithName:@"植树节" desc:@"植树节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 401: {
            Festival *f = [Festival festivalWithName:@"愚人节" desc:@"愚人节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 501: {
            Festival *f = [Festival festivalWithName:@"劳动节" desc:@"国际劳动节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 504: {
            if (ltDate.year >= 1949) {
                Festival *f = [Festival festivalWithName:@"青年节" desc:@"中国五四青年节" ltDate:ltDate lunar:false];
                [festivals addObject:f];
            }
            break;
        }
        case 601: {
            Festival *f = [Festival festivalWithName:@"儿童节" desc:@"国际儿童节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 701: {
            if (ltDate.year >= 1921) {
                Festival *f = [Festival festivalWithName:@"建党" desc:@"中国共产党建党日" ltDate:ltDate lunar:false];
                [festivals addObject:f];
            }
            break;
        }
        case 801: {
            if (ltDate.year >= 1933) {
                Festival *f = [Festival festivalWithName:@"建军节" desc:@"中国建军节" ltDate:ltDate lunar:false];
                [festivals addObject:f];
            }
            break;
        }
        case 910: {
            Festival *f = [Festival festivalWithName:@"教师节" desc:@"教师节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 1001: {
            if (ltDate.year >= 1949) {
                Festival *f = [Festival festivalWithName:@"国庆节" desc:@"国庆节节" ltDate:ltDate lunar:false];
                [festivals addObject:f];
            }
            break;
        }
        case 1111: {
            Festival *f = [Festival festivalWithName:@"光棍节" desc:@"光棍节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 1224: {
            Festival *f = [Festival festivalWithName:@"平安夜" desc:@"平安夜" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        case 1225: {
            Festival *f = [Festival festivalWithName:@"圣诞节" desc:@"圣诞节" ltDate:ltDate lunar:false];
            [festivals addObject:f];
            break;
        }
        default: {
            int weekday = [Festival getWeekday:ltDate];
            switch (ltDate.month) {
                case 5: {
                    if (weekday == 7)
                        if (ltDate.day > 7 && ltDate.day <= 14) {
                            Festival *f = [Festival festivalWithName:@"母亲节" desc:@"母亲节" ltDate:ltDate lunar:false];
                            [festivals addObject:f];
                        }
                    break;
                }
                case 6: {
                    if (weekday == 7)
                        if (ltDate.day > 14 && ltDate.day <= 21) {
                            Festival *f = [Festival festivalWithName:@"父亲节" desc:@"父亲节" ltDate:ltDate lunar:false];
                            [festivals addObject:f];
                        }
                    break;
                }
                case 11: { /*感恩节*/
                    if (weekday == 4) {
                        if (ltDate.day > 21 && ltDate.day < 29) {
                            Festival *f = [Festival festivalWithName:@"感恩节" desc:@"感恩节" ltDate:ltDate lunar:false];
                            [festivals addObject:f];
                        }
                    }
                    break;
                }
            }
            break;
        }
    }
    return festivals;
}

+ (NSString *)lunarFestivalWithSolarDate:(NSDate *)sDate {
    return nil;
}

+ (NSString *)lunarFestivalWithLunarDate:(LunarDate *)lDate {
    NSString *festival = @"";
    int monthDay = lDate.month * 100 + lDate.day;
    switch (monthDay) {
        case 101: 
        {
            festival = @"春节";
            break;
        }
        case 115: {
            festival =  @"元宵节";
            break;
        }
        case 505: {
            festival =  @"端午节";
            break;
        }
        case 707: {
            festival =  @"七夕";
            break;
        }
        case 715: {
            festival =  @"中元节";
            break;
        }
        case 815: {
            festival =  @"中秋节";
            break;
        }
        case 909: {
            festival =  @"重阳节";
            break;
        }
        case 1208: {
            festival =  @"腊八节";
            break;
        }
        case 1223: {
            festival =  @"小年";
            break;
        }
        case 1230: {
            festival =  @"除夕";
            break;
        }
        default: 
        {
            if (lDate.month == 12 && lDate.day == 29) { // 未考虑闰腊月的情况
                int days = [LunarDate daysOfYear:lDate.year inMonth:lDate.month];
                if (days == 29) {
                    festival = @"除夕";
                }
                else {
                    festival = @"";
                }
            }
            else {
                festival = @"";
            }
            break;
        }
    }
    return festival;
}

@end
