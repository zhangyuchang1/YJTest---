//
//  StatisticManager.m
//  GameMall
//
//  Created by zyc on 16/6/6.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "StatisticManager.h"
#import "StatisticKit.h"
// 统计在本地，超过最大数上传
static NSInteger countMax = 10;
// 超过3分钟上传
static NSTimeInterval interValMax = 20;

@interface StatisticManager()
{
    dispatch_source_t _timer; //定时器
//    NSMutableArray *_temList;
    NSMutableDictionary *_temDictionary;
    
     //非第一次 本地上传
    BOOL   _isNotFirst;
    //非第一次 本地上传提交
    BOOL   _isNotFirstUpdate;
    //第一次时候统计类型
    StatisType _firstStatic;
    
    NSInteger  _interval;
    
    
}
@property (nonatomic,retain) NSMutableDictionary *fielDictionary;//统计本地字典  @{@"DailyStatisticDate":date（日期）  ,@"list"@[@"400",@"401"]}
@end
@implementation StatisticManager

+ (StatisticManager *)sharedManager
{
    static StatisticManager *sharedManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedManagerInstance = [[self alloc] init];
    });
    return sharedManagerInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - getter
- (BOOL)isDailyStatisticed
{
    NSDate *date = self.fielDictionary[@"DailyStatisticDate"];
    if ([date isKindOfClass:[NSNumber class]])
    {
        return NO;
    }
    if (![self isToday:date]) {
        return NO;
    }
    return YES;
}
- (NSMutableArray *)list
{

        NSArray *array = self.fielDictionary[@"list"];
        NSMutableArray *mutArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            
            [mutArray addObject:dic];
            
        
        }
    
    return mutArray;

}
- (NSMutableDictionary *)fielDictionary
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"statistic.plist"];

    //读文件
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:filename];
    if ([dic isKindOfClass:[NSDictionary class]] && [dic count] > 0)
    {
        return [NSMutableDictionary dictionaryWithDictionary:dic];
    }
    else
    {
        //首次 创建
        NSFileManager* fm = [NSFileManager defaultManager];
        [fm createFileAtPath:filename contents:nil attributes:nil];
        
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *path=[paths objectAtIndex:0];
        NSString *filename= [path stringByAppendingPathComponent:@"statistic.plist"];
        
        
        NSMutableDictionary * writeDic;
        
        if ([NSDictionary dictionaryWithContentsOfFile:filename]) {
            writeDic = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
        }else {
            writeDic = [[NSMutableDictionary alloc] initWithCapacity:0];
        }
        
        
        [writeDic setObject:@0 forKey:@"DailyStatisticDate"];
        [writeDic setObject:@[] forKey:@"list"];
        [writeDic writeToFile:filename atomically:YES];
        
        return writeDic;
    }
    
}
#pragma mark - data
//保存到本地
- (void)saveToLocation
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"statistic.plist"];
    
    [_temDictionary writeToFile:filename atomically:YES];
}
//本地重置  是否已上传今天日活
- (void)reSetLocation:(BOOL)dailyActIsUpdated compare:(NSArray *)uploadList
{
    if (dailyActIsUpdated)
    {
        [_temDictionary setObject:[NSDate date] forKey:@"DailyStatisticDate"];
    }
    
    //与本地对比
    NSMutableArray *balanceList = [NSMutableArray arrayWithArray:self.fielDictionary[@"list"]];
    [balanceList removeObjectsInRange:NSMakeRange(0, uploadList.count)];
    if (balanceList.count) {
        NSLog(@"上传过程发生统计");
    }
    
    [_temDictionary setObject:balanceList forKey:@"list"];
    [self saveToLocation];
    
    if (!_isNotFirstUpdate && _firstStatic) {
        _isNotFirstUpdate = YES;
        [self addStatistic:_firstStatic];
        _firstStatic = 0;
    }else{
        _isNotFirstUpdate = YES;
    }
}
- (void)addStatistic:(StatisType)statistic
{
    //第一次加时候（app启动） 如果有本地的 先把本地上传，上传完删掉本地再 执行这个方法
    _temDictionary = [NSMutableDictionary dictionaryWithDictionary:self.fielDictionary];
    NSLog(@"self.list 的 个数 - %d",self.list.count);

    if (self.list.count && !_isNotFirst)
    {
        _firstStatic = statistic;
        _isNotFirst = YES;
      [self upload];
        return;
    }else{
        _isNotFirst = YES;
    }
    
    if(statistic  == StatisticType_UserDailyActivity)
    {
        // 日活统计
        if (![self isShouldDailyActiveUpdate])
        {
            return;
        }
    }


    NSMutableArray *arrayTemp = [NSMutableArray arrayWithArray:self.list];
    
    [arrayTemp addObject:@{@"type":[NSNumber numberWithInteger:statistic]}];
    
    [_temDictionary setObject:arrayTemp forKey:@"list"];
    
    if(self.list.count > countMax - 2) //到最大个数时上传 此时self.list没写入
    {
        //防止与定时器冲突
        @synchronized(self) {
            [self upload];
        }
    }
    else if(self.list.count == 0)  //统计了一个之后开始定时 上传 此时self.list没写入
    {
        [self saveToLocation];
//            dispatch_resume(_timer);
        
        [self readyForUpload];
//        dispatch_suspend(_timer);
    }
    else
    {
        [self saveToLocation];
    }
    
}
// 是否应该加到统计列表中
- (BOOL)isShouldDailyActiveUpdate
{
    if(self.isDailyStatisticed)
    {
        //日活已上传
        return NO;
    }
    else
    {
        for (NSDictionary *dic in self.list)
        {
            if ([dic[@"type"] integerValue] == StatisticType_UserDailyActivity)
            {
                //日活已记录
                return NO;
            }
        }
    }
    return YES;
}


// 准备 若干秒 后上传
- (void)readyForUpload
{
    _interval = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //        dispatch_queue_t queue = dispatch_queue_create("com.dispatch.statistic", DISPATCH_QUEUE_CONCURRENT);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0),NSEC_PER_SEC, 0); //每秒执行
    
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        _interval ++;
        NSLog(@"计时 - %d",_interval);
        if ((NSInteger)_interval % (NSInteger)interValMax == 0) {
            //防止冲突
            @synchronized (self) {
                [weakSelf upload];
            }
        }
    });
    dispatch_resume(_timer);

    NSLog(@"%fs 后 开始上传 -----",interValMax);

}

//提交
- (void)upload
{
    
    NSLog(@"开始上传 -----");
    if (!self.list.count)
    {
        return;
    }
    
    
    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
    NSArray *list = _temDictionary[@"list"];
    
    //上传之前的备份与上传之后清空本地时对比下，防止快速点击
    
    
    NSDictionary *listDic = @{@"accessList":list};
    NSData *listData = [NSJSONSerialization dataWithJSONObject:listDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:listData encoding:NSUTF8StringEncoding];
    
    
    [parms setObject:jsonString forKey:@"accessList"];
    [parms setObject:@"sta_Access" forKey:@"methodName"];
    
//    
    NSString *requestUrl = @"test - url";

    [self testRequest:requestUrl parms:parms success:^(id responseObject) {
        
        if (responseObject)
        {
            //提交完成，定时器关闭
            //    dispatch_source_cancel(_timer);
            
            NSLog(@"上传成功 -----");

            if (_timer) {
                
                dispatch_source_cancel(_timer);
            }
            NSLog(@"* * 定时器取消 * *");
            //如果有上传日活
            BOOL isUpdateDailyAct = NO;
            for (NSDictionary *dic in self.list)
            {
                if ([dic[@"type"] integerValue] == StatisticType_UserDailyActivity)
                {
                    //日活已记录
                    isUpdateDailyAct = YES;
                }
            }
            
            //本地置空
            [self reSetLocation:isUpdateDailyAct compare:list];
        }
        else
        {
            NSLog(@"上传统计失败");
        }

    } failure:^(NSError *error) {
        
        NSLog(@"上传统计失败");

        
    }];
}

//是否为今天
- (BOOL)isToday:(NSDate *)date{
    
    NSDate *today = [NSDate date];
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)testRequest:(NSString *)rrl parms:(NSDictionary *)parms
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;
{
    NSDictionary *dic = @{@"info":@"YES"};
    success(dic);
    
    
}
@end
