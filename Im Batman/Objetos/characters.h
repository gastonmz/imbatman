//
//  characters.h
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import <Foundation/Foundation.h>
#import "charactersData.h"

NS_ASSUME_NONNULL_BEGIN

@interface characters : NSObject
@property (nonatomic, copy) NSNumber *code;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSString *attributionText;
@property (nonatomic, copy) NSString *etag;
@property (nonatomic, strong, readwrite) charactersData *data;

@property (nonatomic, copy) NSNumber *characterId;

+ (NSDictionary*) elementosApropiedadMapping;

@end

NS_ASSUME_NONNULL_END
