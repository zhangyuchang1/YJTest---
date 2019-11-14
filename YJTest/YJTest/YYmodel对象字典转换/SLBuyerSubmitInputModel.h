//
//  SLBuyerSubmitInputModel.h
//  YJTest
//
//  Created by zyc on 2019/11/14.
//  Copyright © 2019 zyc. All rights reserved.
//

/*
 1. proprerty 中 数字类型 最好写int64_t 还是 NSNumber ？
 
 2. 可选的字段， property怎么写比较好 ?
 */



#import "BaseModel.h"

// 单个商品提交订单传参模型
@interface SLBuyerSubmitInputModel : BaseModel

/// 买家收货地址
@property (nonatomic, strong) NSNumber *addressId;

@property (nonatomic, strong) NSObject *orderData;

/// 库存id
@property (nonatomic, strong) NSNumber *inventroyId;
/// 购买数量
@property (nonatomic, strong) NSNumber *num;
/// 产品id
@property (nonatomic, assign) int64_t productId;
/// 产品类型
@property (nonatomic, assign) int productType;
/// 店铺数据, 可选
@property (nonatomic, strong) NSObject *spaceData;
/// 买家备注, 可选
@property (nonatomic, copy) NSString *buyerRemarks;
/// 优惠id,  可选
@property (nonatomic, assign) int64_t discountId;
/// 优惠类型,  可选
@property (nonatomic, assign) int discountType;
/// 店铺id
@property (nonatomic, assign) int64_t spaceId;
/// 场景id，直播间对应着直播id， 可选
@property (nonatomic, assign) int64_t sceneObjectId;
/// 订单场景，1：直播间， 可选
@property (nonatomic, assign) int sceneSource;
/// 订单场景，1：直播间
@property (nonatomic, assign) int64_t shareUserId;


@end


/*
{
    "addressId": 12,
    "orderData": {
        "productData": {
            "inventroyInfo": {
                "inventroyId": 12,
                "num": 2
            },
            "productId": 123,
            "productType": 1
        },
        "spaceData": {
            "buyerRemarks": "我是备注",
            "discountId": 12,
            "discountType": 1,
            "spaceId": 221
        }
    },
    "sceneObjectId": 232,
    "sceneSource": 1,
    "shareUserId": 23
}
 
 */

