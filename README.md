# LunarTerm
LunarDate &amp; SolarTerm

LunarTerm 是一个公农历转换工具，可以方便的进行公农历转换。

# 公历转农历
```Objective-C
LunarDate *lDate = [LunarDate lunarDateWithSolarDate:(LTDate){2017, 2, 3}];
NSLog(@"%@", lDate);
```

# 农历转公历
```Objective-C
LunarDate *lDate = [LunarDate lunarDateWithYear:2017 month:1 day:1 leap:YES];
NSLog(@"%@ -> %d-%d-%d", lDate, (int)lDate.solarDate.year, (int)lDate.solarDate.month, (int)lDate.solarDate.day);
```
# 二十四节气
```Objective-C
NSInteger day = [SolarTerm getDayForTerm:2017 indexAtTermArray:LiChun];
NSLog(@"%d", (int)day);
```
