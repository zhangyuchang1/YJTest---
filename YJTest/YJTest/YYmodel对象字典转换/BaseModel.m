// 
/**  
 * All rights Reserved, Designed By 视连时代(上海)信息科技有限公司
 * @Title:   BaseModel.m 
 * @Package  ShopScreen
 * @author:  zyc     
 * @date:    2019/10/10 3:24 PM
 * @Copyright: 2019 视连时代(上海)信息科技有限公司 All rights reserved. 
 * 注意：本内容仅限于内部传阅，禁止外泄以及用于其他的商业目
 */

#import "BaseModel.h"

@implementation BaseModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             // 模型属性: JSON key, MJExtension 会自动将 JSON 的 key 替换为你模型中需要的属性
             @"id_":@"id",
             };

}


@end
