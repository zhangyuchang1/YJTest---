//
//  YJModel.h
//  YJTest
//
//  Created by zyc on 2019/11/14.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "BaseModel.h"


// 列表中的对象
@interface YJModelItem: BaseModel

@property (nonatomic,copy) NSString *itemSting1;
@property (nonatomic,assign) int64_t itemint1;

@end

// 第二层的对象
@interface YJModelSub: BaseModel

@property (nonatomic,copy) NSString *stingSub1;
@property (nonatomic,assign) int64_t intSub1;
@property (nonatomic,assign) int64_t id_;

@end


@interface YJModel : BaseModel

@property (nonatomic,strong) YJModelSub *objSub;
@property (nonatomic,copy) NSString *sting1;
@property (nonatomic,strong) NSNumber *number1;

@property (nonatomic,copy) NSString *int1;

/// 字典带关键字转化
@property (nonatomic,assign) int64_t id_;
/// list对象转换
@property (nonatomic,strong) NSArray <YJModelItem*> *items;


@end

