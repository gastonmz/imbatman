//
//  common.h
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

NS_ASSUME_NONNULL_BEGIN

#define MARVEL_PUBLIC_KEY @"d6c8ea9e3de2f070215b7c04853cd536"
#define MARVEL_PRIVATE_KEY @"ee32575f9c8f01fdb9ea5f3ace5e699e0e59468b"
#define MARVEL_BASE_URL @"https://gateway.marvel.com"
#define MARVEL_ATTRIBUTION @"Data provided by Marvel. © 2022 Marvel"
#define MARVEL_API_CHARACTERS @"/v1/public/characters"

#define TIME_STAMP [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000]

#define RK_ROUTE_CARACTER @"caracter"
#define RK_ROUTE_LISTA @"lista"

#define PANTALLA_LARGO ([[UIScreen mainScreen] bounds].size.width)
#define PANTALLA_ALTO ([[UIScreen mainScreen] bounds].size.height)

@interface common : NSObject
+ (NSString *) md5:(NSString *) input;
+ (NSString *) createMarvelHash: (NSString*)ts;
@end

NS_ASSUME_NONNULL_END
