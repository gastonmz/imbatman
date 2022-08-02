//
//  common.m
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import "common.h"

@implementation common

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+ (NSString *) md5:(NSString *) input {
    // Stackoverflow milagros...
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (uint32_t)strlen(cStr), digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}
#pragma clang diagnostic pop

+ (NSString *) createMarvelHash: (NSString*)ts{
    return [self md5:[NSString stringWithFormat:@"%@%@%@",ts,MARVEL_PRIVATE_KEY,MARVEL_PUBLIC_KEY]];
}

+ (NSDictionary *)JSONFromFile: (NSString*)anim {
    NSString *path = [[NSBundle mainBundle] pathForResource:anim ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
@end

