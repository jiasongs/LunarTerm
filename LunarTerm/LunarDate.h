//
//  LunarDate.h
//  LunarTerm
//
//  Created by yiping wang on 14-1-15.
//
//

#import <Foundation/Foundation.h>
#import "LTDate.h"

@interface LunarDate : NSObject
@property (nonatomic, assign) int year;
@property (nonatomic, assign) int month;
@property (nonatomic, assign) int day;
@property (nonatomic, assign) BOOL leap;

@property (nonatomic, assign) LTDate solarDate;

/**
 * @brief 给定农历年月日生成农历对象
 *
 * @param year              农历年
 * @param month            农历月份
 * @param day               农历日
 * @param leap              是否闰月
 *
 * @return LunarDate Object
 */
- (id)initWithYear:(int)year month:(int)month day:(int)day leap:(BOOL)leap;

/**
 * @brief 给定农历年月日生成农历对象
 * @see initWithYear:(int)year month:(int)month day:(int)day leap:(BOOL)leap;
 *
 * @param year              农历年
 * @param month            农历月份
 * @param day               农历日
 * @param leap              是否闰月
 *
 * @return LunarDate Object
 */
+ (LunarDate *)lunarDateWithYear:(int)year month:(int)month day:(int)day leap:(BOOL)leap;


/**
 * @brief 给定NSDate生成农历对象
 *
 * @param date              公历时间戳
 *
 * @return LunarDate Object
 */
- (id)initWithSolarDate:(LTDate)date;
+ (LunarDate *)lunarDateWithSolarDate:(LTDate)date;

/**
 * @brief 给定农历年返回该年份的天数
 *
 * @param year              农历年
 *
 * @return 农历年天数
 */
+ (int)daysOfYear:(int)year;

/**
 * @brief 给定农历年返回该年份闰月的天数，如果没有闰月返回0
 *
 * @param year              农历年
 *
 * @return 农历年闰月天数
 */
+(int)leapDaysOfYear:(int)year;

/**
 * @brief 给定农历年返回该年份的闰月，没有闰月返回0
 *
 * @param year              农历年
 *
 * @return 农历年闰月月份
 */
+(int)leapMonthOfYear:(int)year;

/**
 * @brief 给定农历年和月返回该月份的天数
 * @see daysOfYear:(int)y inMonth:(int)m leap:(BOOL *)leap
 *
 * @param year              农历年
 * @param month             农历月
 *
 * @return 该月天数
 */
+(int)daysOfYear:(int)year inMonth:(int)month;

/**
 * @brief 给定农历年和月返回该月份的天数
 *
 * @param year              农历年
 * @param month             农历月
 * @param leap              农历月是否为闰月,该值可能会被改变
 *
 * @return 该月天数
 */
+(int)daysOfYear:(int)year inMonth:(int)month leap:(BOOL *)leap;

/**
 * 判断公历是否闰年
 */
+ (BOOL)isSolarYearLeap:(int)year;

/**
 * @brief 获取农历日期所在月份的天数
 * @return 返回农历日期所在月份的天数
 */
- (NSInteger)daysInMonth;


- (NSString *)lunarDayDisplay;
- (NSString *)lunarMonthDisplay;
- (NSString *)lunarYearDisplay;

+ (NSString *)lunarDisplayForDay:(int)day;
+ (NSString *)lunarDisplayForMonth:(int)month isLeap:(BOOL)isLeap;
+ (NSString *)lunarDisplayForYear:(int)year;


- (NSString*)lunarDateDescription;
- (NSString *)lunarDisplay;

/**
 * @brief 获得属相
 *
 * @return 属相
 */
- (int)zodiacAnimal;

/**
 * @brief 获得属相中文描述
 *
 * @return 属相中文描述
 */
- (NSString *)zodiacAnimalSignChinese;

/**
 * @brief 获得属相英文文描述
 *
 * @return 属相英文描述
 */
- (NSString *)zodiacAnimalSign;

/**
 * @brief 干支纪年
 */
- (NSString *)chineseAraDisplayString;
- (NSString *)chineseAraYearString;
- (NSString *)chineseAraMonthString;
- (NSString *)chineseAraDayString;

+ (NSString *)chineseAraYearStringWithSolarDate:(LTDate)sDate;
+ (NSString *)chineseAraMonthStringWithSolarDate:(LTDate)sDate;
+ (NSString *)chineseAraDayStringWithSolarDate:(LTDate)sDate;

+ (NSInteger)lunarHourFromSolarHour:(NSInteger)hour;
+ (NSString *)descriptionOfLunarHour:(NSInteger)hour;
@end
