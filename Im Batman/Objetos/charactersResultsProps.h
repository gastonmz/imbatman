//
//  charactersResultsProps.h
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import <Foundation/Foundation.h>
#import "charactersResultsPropsItems.h"

NS_ASSUME_NONNULL_BEGIN

@interface charactersResultsProps : NSObject
@property (nonatomic, copy) NSNumber *available;
@property (nonatomic, copy) NSString *collectionURI;
//@property (nonatomic, strong, readwrite) charactersResultsPropsItems *items;
@property (nonatomic, strong, readwrite) NSMutableArray <charactersResultsPropsItems *> *items;
@property (nonatomic, copy) NSNumber *returned;

+ (NSDictionary*) elementosApropiedadMapping;

@end

NS_ASSUME_NONNULL_END
