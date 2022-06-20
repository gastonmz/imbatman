//
//  charactersResults.h
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import <Foundation/Foundation.h>
#import "charactersResultsThumbnail.h"
#import "charactersResultsUrls.h"
#import "charactersResultsProps.h"

NS_ASSUME_NONNULL_BEGIN

@interface charactersResults : NSObject
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *offmodifiedset;
@property (nonatomic, strong, readwrite) charactersResultsThumbnail *thumbnail;
@property (nonatomic, copy) NSString *resourceUri;
@property (nonatomic, strong, readwrite) charactersResultsProps *comics;
@property (nonatomic, strong, readwrite) charactersResultsProps *series;
@property (nonatomic, strong, readwrite) charactersResultsProps *stories;
@property (nonatomic, strong, readwrite) charactersResultsProps *events;
@property (nonatomic, strong, readwrite) charactersResultsUrls *urls;

@end

NS_ASSUME_NONNULL_END
