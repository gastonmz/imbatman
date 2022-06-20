//
//  charactersResultsProps.m
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import "charactersResultsProps.h"

@implementation charactersResultsProps

+ (NSDictionary*) elementosApropiedadMapping {
  return @{
    @"available": @"available",
    @"collectionURI": @"collectionURI",
    @"returned": @"returned"
  };
}

+ (NSDictionary*) elementosReducidosApropiedadMapping;{
    return @{
      @"available": @"available"
    };
}
@end
