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
@property (nonatomic, copy) NSString *modified;
@property (nonatomic, strong, readwrite) charactersResultsThumbnail *thumbnail;
@property (nonatomic, copy) NSString *resourceUri;
@property (nonatomic, strong, readwrite) NSMutableArray <charactersResultsProps *> *comics;
@property (nonatomic, strong, readwrite) NSMutableArray <charactersResultsProps *> *series;
@property (nonatomic, strong, readwrite) NSMutableArray <charactersResultsProps *> *stories;
@property (nonatomic, strong, readwrite) NSMutableArray <charactersResultsProps *> *events;
@property (nonatomic, strong, readwrite) NSMutableArray <charactersResultsUrls *> *urls;


+ (NSDictionary*) elementosApropiedadMapping;

@end

NS_ASSUME_NONNULL_END
