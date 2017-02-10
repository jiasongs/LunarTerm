//
//  Festival.h
//  CalendarLib
//
//  Created by wbitos on 11-8-11.
//  Copyright 2011年 wbitos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTDate.h"
#import "LunarDate.h"

@interface Festival : NSObject
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *desc;
@property (nonatomic, assign, readonly) LTDate    ltDate;
@property (nonatomic, assign, readonly) BOOL      lunar;
@property (nonatomic, strong, readonly) NSArray   *components;
@property (nonatomic, assign, readonly) NSInteger fromYear;

+ (NSArray *)solarFestivalWithDate:(NSDate *)date;
+ (NSArray *)solarFestivalWithGDate:(LTDate)gDate;

+ (NSString *)lunarFestivalWithSolarDate:(NSDate *)sDate;
+ (NSString *)lunarFestivalWithLunarDate:(LunarDate *)lDate;
@end
