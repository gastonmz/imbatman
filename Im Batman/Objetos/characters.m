//
//  characters.m
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import "characters.h"

@implementation characters

+ (NSDictionary*) elementToPropertyMappings {
  return @{
    @"code": @"code",
    @"status": @"status",
    @"copyright": @"copyright",
    @"attributionText": @"attributionText",
    @"etag": @"etag"
  };
}

@end

