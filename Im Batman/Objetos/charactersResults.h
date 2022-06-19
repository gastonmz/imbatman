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
@property (nonatomic, copy) charactersResultsThumbnail *thumbnail;
@property (nonatomic, copy) NSString *resourceUri;
@property (nonatomic, copy) charactersResultsProps *comics;
@property (nonatomic, copy) charactersResultsProps *series;
@property (nonatomic, copy) charactersResultsProps *stories;
@property (nonatomic, copy) charactersResultsProps *events;
@property (nonatomic, copy) charactersResultsUrls *urls;

@end

NS_ASSUME_NONNULL_END
