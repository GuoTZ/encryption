//
//  AesUtils.m
//  Project
//
//  Created by DingYD on 2019/4/11.
//  Copyright © 2019 Guotzh. All rights reserved.
//

#import "AesUtils.h"
#import "CocoaSecurity.h"

static const unsigned char bytes[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
#define hashStr @"123456"
@implementation AesUtils
+ (NSString *)encryptWithString:(NSString *)data {
    if (!data) {
        return nil;
    }
    CocoaSecurityResult *cocoaSecurityResult = [CocoaSecurity aesEncrypt:data key:[AesUtils createKeyData].data iv:[AesUtils createIvData]];
    if (cocoaSecurityResult) {
        return cocoaSecurityResult.base64;
    }
    return nil;
}
+ (NSString *)decryptWithBase64:(NSString *)data {
    if (!data) {
        return nil;
    }
    CocoaSecurityResult *cocoaSecurityResult = [CocoaSecurity aesDecryptWithBase64:data key:[AesUtils createKeyData].data iv:[AesUtils createIvData]];
    if (cocoaSecurityResult) {
        return cocoaSecurityResult.utf8String;
    }
    return nil;
}
+ (CocoaSecurityResult *)createKeyData {
    CocoaSecurityResult *keyCocoaSecurity = [CocoaSecurity sha256:hashStr];
    return keyCocoaSecurity;
}
+ (NSData *)createIvData {
    NSData *ivData = [NSData dataWithBytes:bytes length:16];
    return ivData;
}
@end
