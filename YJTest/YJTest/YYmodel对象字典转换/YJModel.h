//
//  YJModel.h
//  YJTest
//
//  Created by zyc on 2019/11/14.
//  Copyright © 2019 zyc. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN




// 第二层的对象
@interface YJModelSub: NSObject

@property (nonatomic,copy) NSString *stingSub1;
@property (nonatomic,assign) int64_t intSub1;

@end


@interface YJModel : BaseModel

@property (nonatomic,strong) YJModelSub *objSub;
@property (nonatomic,copy) NSString *sting1;
@property (nonatomic,strong) NSNumber *number1;

@property (nonatomic,copy) NSString *int1;

@end

NS_ASSUME_NONNULL_END
