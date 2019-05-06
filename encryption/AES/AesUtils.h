//
//  AesUtils.h
//  Project
//
//  Created by DingYD on 2019/4/11.
//  Copyright © 2019 Guotzh. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface AesUtils : NSObject

+ (NSString *)encryptWithString:(NSString *)data;
+ (NSString *)decryptWithBase64:(NSString *)data;
@end
