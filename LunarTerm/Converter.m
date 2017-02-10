//
//  Converter.m
//  LunarTerm
//
//  Created by wbitos on 2017/2/10.
//  Copyright © 2017年 wbitos. All rights reserved.
//

#import "Converter.h"

@implementation Converter
static NSArray *_chineseNumbers = nil;

+ (void)initialize {
    _chineseNumbers = [NSArray arrayWithObjects:@"零",@"一",@"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", nil];
}

+ (NSString *)convertNumberToChinese:(int)n {
    int y = n;
    NSMutableArray *nums = [NSMutableArray array];
    while (y>0) {
        int a = y % 10;
        [nums insertObject:_chineseNumbers[a] atIndex:0];
        y = y / 10;
    }
    return [nums componentsJoinedByString:@""];
}
@end
