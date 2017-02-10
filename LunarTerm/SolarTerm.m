//
//  SolarTerm.m
//  LunarTerm
//
//  Created by wbitos on 11-5-19.
//  Copyright 2011年 wbitos. All rights reserved.
//

#import "SolarTerm.h"
#import "NSDate+Gregorian.h"
#import "Converter.h"

typedef struct SolarTermDetail {
    unsigned char yushui:2;
    unsigned char lichun:2;
    unsigned char dahan:2;
    unsigned char xiaohan:2;
    
    unsigned char guyu:2;
    unsigned char qingming:2;
    unsigned char chunfen:2;
    unsigned char jingzhe:2;
    
    unsigned char xiazhi:2;
    unsigned char mangzhong:2;
    unsigned char xiaoman:2;
    unsigned char lixia:2;
    
    unsigned char chushu:2;
    unsigned char liqiu:2;
    unsigned char dashu:2;
    unsigned char xiaoshu:2;
    
    unsigned char shuangjiang:2;
    unsigned char hanlu:2;
    unsigned char qiufen:2;
    unsigned char bailu:2;
    
    unsigned char dongzhi:2;
    unsigned char daxue:2;
    unsigned char xiaoxue:2;
    unsigned char lidong:2;
}SolarTermDetail;

typedef struct SolarTermItem {
    union {
        unsigned char info[6];
        SolarTermDetail detail;
    };
}SolarTermItem;

const int solarTermOffset[] = {4,19,3,18,4,19,4,19,4,20,4,20,6,22,6,22,6,22,7,22,6,21,6,21};
//const int solarTermMax[]    = {7,21,5,20,7,22,6,21,7,22,7,22,8,24,9,24,9,24,9,24,8,23,8,23};

const SolarTermItem solarTermTable[] = {
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},       //1901
{0XA9,0XAA,0XAE,0XAA,0XAA,0XAA},
{0XAA,0XFA,0XEE,0XAE,0XEA,0XAA},
{0XEA,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0XAA,0XAA,0XAA,0XAA,0XAA},
{0XAA,0XFA,0XEE,0XAE,0XEA,0XAA},
{0XEA,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0XAA,0XAA,0XAA,0XAA,0XAA},
{0XAA,0XFA,0XEE,0XAE,0XEA,0XAA},
{0XEA,0XA5,0X9A,0X59,0X9A,0XA5},
{0X95,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA5,0XA6,0XAA,0XAA,0XAA,0XAA},
{0XAA,0XBA,0XAE,0XAA,0XEA,0XAA},
{0XAA,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA6,0X9A,0X9A,0X9A,0XA5},
{0XA5,0XA6,0XAA,0XAA,0XAA,0XA9},
{0XAA,0XBA,0XAE,0XAA,0XEA,0XAA},
{0XAA,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X9A,0X9A,0XA5},
{0XA5,0XA6,0XAA,0XAA,0XAA,0XA9},
{0XA9,0XAA,0XAE,0XAA,0XEA,0XAA},
{0XAA,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X9A,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0XAA,0XAE,0XAA,0XAA,0XAA},
{0XAA,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0XAA,0XAE,0XAA,0XAA,0XAA},
{0XAA,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0XAA,0XAA,0XAA,0XAA,0XAA},
{0XAA,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0XAA,0XAA,0XAA,0XAA,0XAA},
{0XAA,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0XAA,0XAA,0XAA,0XAA,0XAA},
{0XAA,0XA5,0X59,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA6,0XAA,0X9A,0X9A,0XA9},
{0XA5,0XA6,0XAA,0XAA,0XAA,0XAA},
{0XAA,0X65,0X59,0X55,0X95,0X55},
{0X55,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X9A,0X9A,0XA9},
{0XA5,0XA6,0XAA,0XAA,0XAA,0XAA},
{0XAA,0X65,0X59,0X55,0X95,0X55},
{0X55,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X9A,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XAA,0X55,0X59,0X55,0X95,0X55},
{0X55,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0X55,0X59,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0X55,0X59,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0XAA,0XA9},
{0XA9,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0XA6,0XAA,0X9A,0X9A,0XA9},
{0XA9,0X51,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X96,0XA5},
{0XA5,0XA6,0X9A,0X9A,0X9A,0XA9},
{0XA9,0X51,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X9A,0X9A,0XA9},
{0XA5,0X51,0X55,0X45,0X55,0X55},
{0X55,0X65,0X59,0X55,0X95,0X55},
{0X55,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X5A,0X9A,0XA5},
{0XA5,0X51,0X55,0X45,0X55,0X54},
{0X55,0X55,0X59,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X96,0X95},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X59,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X9A,0XA5},
{0XA5,0X51,0X55,0X45,0X45,0X54},
{0X54,0X51,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X96,0XA5},
{0XA5,0X51,0X45,0X45,0X45,0X54},
{0X54,0X51,0X55,0X45,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0XA5,0X9A,0X59,0X96,0X95},
{0X95,0X50,0X45,0X45,0X45,0X54},
{0X50,0X51,0X55,0X45,0X55,0X55},
{0X55,0X65,0X59,0X55,0X95,0X55},
{0X55,0XA5,0X99,0X59,0X96,0X95},
{0X95,0X50,0X45,0X04,0X45,0X54},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X55,0X55,0X59,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X96,0X95},
{0X95,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X99,0X59,0X95,0X55},
{0X95,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X45,0X45,0X45,0X54},
{0X54,0X51,0X55,0X55,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0X50,0X45,0X04,0X41,0X50},
{0X50,0X50,0X45,0X45,0X45,0X54},
{0X54,0X51,0X55,0X45,0X55,0X55},
{0X55,0XA5,0X59,0X55,0X95,0X55},
{0X95,0X50,0X44,0X04,0X41,0X40},
{0X40,0X50,0X45,0X04,0X45,0X54},
{0X50,0X51,0X55,0X45,0X55,0X55},
{0X55,0X55,0X59,0X55,0X55,0X55},
{0X55,0X50,0X44,0X04,0X41,0X40},
{0X40,0X50,0X45,0X04,0X45,0X54},
{0X50,0X51,0X55,0X45,0X55,0X55},
{0X55,0X55,0X55,0X55,0X55,0X55},
{0X55,0X50,0X44,0X04,0X41,0X40},
{0X40,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X55,0X55,0X55,0X55,0X55,0X55},
{0X55,0X50,0X44,0X04,0X40,0X00},
{0X40,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0X50,0X44,0X04,0X40,0X00},
{0X40,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0X50,0X04,0X00,0X40,0X00},
{0X40,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X45,0X45,0X45,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55},
{0X55,0X50,0X04,0X00,0X40,0X00},
{0X40,0X50,0X45,0X04,0X41,0X50},
{0X50,0X51,0X45,0X45,0X45,0X54},
{0X54,0X51,0X55,0X45,0X55,0X55},
{0X55,0X50,0X04,0X00,0X40,0X00},
{0X40,0X50,0X45,0X04,0X41,0X50},
{0X50,0X50,0X45,0X05,0X45,0X54},
{0X54,0X51,0X55,0X45,0X55,0X55},
{0X55,0X50,0X04,0X00,0X40,0X00},
{0X40,0X50,0X44,0X04,0X41,0X40},
{0X50,0X50,0X45,0X04,0X45,0X54},
{0X50,0X51,0X55,0X45,0X55,0X55},
{0X55,0X00,0X04,0X00,0X00,0X00},
{0X00,0X50,0X44,0X04,0X41,0X40},
{0X40,0X50,0X45,0X04,0X45,0X54},
{0X50,0X51,0X55,0X45,0X55,0X55},
{0X55,0X00,0X00,0X00,0X00,0X00},
{0X00,0X50,0X44,0X04,0X41,0X40},
{0X40,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X55,0X00,0X00,0X00,0X00,0X00},
{0X00,0X50,0X44,0X04,0X40,0X00},
{0X40,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X00,0X00,0X00,0X00,0X00},
{0X00,0X50,0X44,0X00,0X40,0X00},
{0X40,0X50,0X45,0X04,0X45,0X50},
{0X50,0X51,0X55,0X45,0X55,0X54},
{0X54,0X55,0X55,0X55,0X55,0X55}};

static NSArray *SOLAR_TERM = nil;

@interface SolarTerm()

@end

@implementation SolarTerm
+ (void)initialize {
    SOLAR_TERM = @[@"小寒", @"大寒", @"立春", @"雨水", @"惊蛰", @"春分", @"清明", @"谷雨", @"立夏", @"小满", @"芒种", @"夏至", @"小暑", @"大暑", @"立秋", @"处暑", @"白露", @"秋分", @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至"];
}

+ (NSString *)getSolarTerm:(LTDate)gDate {
    int idx = (gDate.month - 1) * 2;
    if ((gDate.day > 2 && gDate.day < 10) || (gDate.day > 17 && gDate.day < 25)) {
        if (gDate.day == [SolarTerm getDayForTerm:gDate.year indexAtTermArray:idx]) {
            return [SOLAR_TERM objectAtIndex:idx];
        }else if(gDate.day == [SolarTerm getDayForTerm:gDate.year indexAtTermArray:idx + 1]){
            return [SOLAR_TERM objectAtIndex:idx+1];
        }
    }
    return @"";
}

+ (NSInteger)getDayForTerm:(NSInteger)year indexAtTermArray:(NSInteger)index{
    if (index >= 0 && index < 24) {
        SolarTermItem info = solarTermTable[year - 1901];
        int day = 0;
        switch (index) {
            case 0:
                day = info.detail.xiaohan + solarTermOffset[0];
                break;
            case 1:
                day = info.detail.dahan + solarTermOffset[1];
                break;
            case 2:
                day = info.detail.lichun + solarTermOffset[2];
                break;
            case 3:
                day = info.detail.yushui + solarTermOffset[3];
                break;
            case 4:
                day = info.detail.jingzhe + solarTermOffset[4];
                break;
            case 5:
                day = info.detail.chunfen + solarTermOffset[5];
                break;
            case 6:
                day = info.detail.qingming + solarTermOffset[6];
                break;
            case 7:
                day = info.detail.guyu + solarTermOffset[7];
                break;
            case 8:
                day = info.detail.lixia + solarTermOffset[8];
                break;
            case 9:
                day = info.detail.xiaoman + solarTermOffset[9];
                break;
            case 10:
                day = info.detail.mangzhong + solarTermOffset[10];
                break;
            case 11:
                day = info.detail.xiazhi + solarTermOffset[11];
                break;
            case 12:
                day = info.detail.xiaoshu + solarTermOffset[12];
                break;
            case 13:
                day = info.detail.dashu + solarTermOffset[13];
                break;
            case 14:
                day = info.detail.liqiu + solarTermOffset[14];
                break;
            case 15:
                day = info.detail.chushu + solarTermOffset[15];
                break;
            case 16:
                day = info.detail.bailu + solarTermOffset[16];
                break;
            case 17:
                day = info.detail.qiufen + solarTermOffset[17];
                break;
            case 18:
                day = info.detail.hanlu + solarTermOffset[18];
                break;
            case 19:
                day = info.detail.shuangjiang + solarTermOffset[19];
                break;
            case 20:
                day = info.detail.lidong + solarTermOffset[20];
                break;
            case 21:
                day = info.detail.xiaoxue + solarTermOffset[21];
                break;
            case 22:
                day = info.detail.daxue + solarTermOffset[22];
                break;
            case 23:
                day = info.detail.dongzhi + solarTermOffset[23];
                break;
            default:
                break;
        }
        return day;
    }
    return 0;
}

+ (NSString *)get39WithYear:(int)y month:(int)m day:(int)d {
    int dongzhi = (int)[self getDayForTerm:y indexAtTermArray:23];
    LTDate gDate = {y, 12, dongzhi};
    
    if (m < 12 || d < dongzhi) {
        dongzhi = (int)[self getDayForTerm:y - 1 indexAtTermArray:23];

        gDate.year = y - 1;
        gDate.month = 12;
        gDate.day = dongzhi;
    }
    
    NSDate *date = [NSDate dateFromCFGregorianDate:gDate];
    NSDate *sDate = [NSDate dateFromCFGregorianDate:(LTDate){y,m,d}];
    
    if ([sDate compare:date] != NSOrderedAscending
        && [date compare:[sDate dateByAddingTimeInterval:86400 * 81]] != NSOrderedDescending) {
        for (int i=1; i<9; i++) {
            date = [date dateByAddingTimeInterval:86400 * 9];
            LTDate gD = [date getGregorianDate];
            
            if (gD.year == y && gD.month == m && gD.day == d) {
                return [NSString stringWithFormat:@"%@九", [Converter convertNumberToChinese:i + 1]];
            }
        }
    }
    return @"";
}

+ (NSDictionary *)get39MapWithYear:(int)y month:(int) m {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    LTDate gDate;
    if (m < 12) {
        int  dongzhi = (int)[self getDayForTerm:y - 1 indexAtTermArray:23];
        gDate.year = y - 1;
        gDate.month = 12;
        gDate.day = dongzhi;
    }
    else {
        int dongzhi = (int)[self getDayForTerm:y indexAtTermArray:23];
        gDate.year = y;
        gDate.month = 12;
        gDate.day = dongzhi;
    }
    
    NSDate *date = [NSDate dateFromCFGregorianDate:gDate];
    for (int i=1; i<9; i++) {
        date = [date dateByAddingTimeInterval:86400 * 9];
        LTDate gD = [date getGregorianDate];
        if (gD.year == y && gD.month == m) {
            [map setObject:[NSString stringWithFormat:@"%@九", [Converter convertNumberToChinese:i + 1]] forKey:@(gD.day)];
        }
    }
    return map;
}

+ (int)getGanWithYear:(int)y month:(int)m day:(int)d {
    if(m == 1|| m == 2){
        y = y-1;
        m = m + 12;
    }
    int c = y/100;
    int y1 = y%100;
    
    return (int) (4*c+floor(c/4)+5*y1+floor(y1/4)+floor(3*(m+1)/5)+d-3)%10;
}

+ (NSString *)get3fWithYear:(int)y month:(int)m day:(int)d {
    int xiazhi = (int)[self getDayForTerm:y indexAtTermArray:11];
    LTDate gDate = {y, 6, xiazhi};
    
    int g = [self getGanWithYear:y month:6 day:gDate.day];
    int od = 20+(g>7?(17-g):(7-g));
    
    NSDate *date = [[NSDate dateFromCFGregorianDate:gDate] dateByAddingTimeInterval:od * 86400];
    
    LTDate gD = [date getGregorianDate];
    
    if (gD.month == m && gD.day == d) {
        return @"初伏";
    }
    
    date = [date dateByAddingTimeInterval:10 * 86400];
    gD = [date getGregorianDate];
    
    if (gD.month == m && gD.day == d) {
        return @"中伏";
    }
    
    int liqiu = (int)[self getDayForTerm:y indexAtTermArray:14];
    gDate = (LTDate){y, 8, liqiu};
    
    g = [self getGanWithYear:y month:8 day:gDate.day];
    od = g>7?(17-g):(7-g);

    date = [[NSDate dateFromCFGregorianDate:gDate] dateByAddingTimeInterval:od * 86400];
    gD = [date getGregorianDate];
    if (gD.month == m && gD.day == d) {
        return @"末伏";
    }
    return @"";
}

+ (NSDictionary *)get3fMapWithYear:(int)y month:(int)m {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    int xiazhi = (int)[self getDayForTerm:y indexAtTermArray:11];
    LTDate gDate = {y, 6, xiazhi};
    
    int g = [self getGanWithYear:y month:6 day:gDate.day];
    int od = 20+(g>7?(17-g):(7-g));
    
    NSDate *date = [[NSDate dateFromCFGregorianDate:gDate] dateByAddingTimeInterval:od * 86400];
    LTDate gD = [date getGregorianDate];

    if (gD.month == m) {
        [map setObject:@"初伏" forKey:@(gD.day)];
    }
    
    date = [date dateByAddingTimeInterval:10 * 86400];
    gD = [date getGregorianDate];
    
    if (gD.month == m) {
        [map setObject:@"中伏" forKey:@(gD.day)];
    }
    
    int liqiu = (int)[self getDayForTerm:y indexAtTermArray:14];
    gDate = (LTDate){y, 8, liqiu};
    
    g = [self getGanWithYear:y month:8 day:gDate.day];
    od = g>7?(17-g):(7-g);
    
    date = [[NSDate dateFromCFGregorianDate:gDate] dateByAddingTimeInterval:od * 86400];
    gD = [date getGregorianDate];

    if (gD.month == m) {
        [map setObject:@"末伏" forKey:@(gD.day)];
    }    
    return map;
}
@end
