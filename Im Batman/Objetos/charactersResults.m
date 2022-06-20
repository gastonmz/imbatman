//
//  charactersResults.m
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import "charactersResults.h"

@implementation charactersResults

@synthesize description;

+ (NSDictionary*) elementosApropiedadMapping {
  return @{
    @"id": @"id",
    @"name": @"name",
    @"description": @"description",
    @"modified": @"modified",
    @"resourceURI": @"resourceUri"
  };
}

@end
