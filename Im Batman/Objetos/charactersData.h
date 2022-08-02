//
//  charactersData.h
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import <Foundation/Foundation.h>
#import "charactersResults.h"

NS_ASSUME_NONNULL_BEGIN

@interface charactersData : NSObject
@property (nonatomic, copy) NSNumber *offset;
@property (nonatomic, copy) NSNumber *limit;
@property (nonatomic, copy) NSNumber *total;
@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, strong, readwrite) NSMutableArray <charactersResults *> *results;

+ (NSDictionary*) elementosApropiedadMapping;

@end

NS_ASSUME_NONNULL_END
