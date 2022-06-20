//
//  charactersResultsPropsItems.h
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface charactersResultsPropsItems : NSObject
@property (nonatomic, copy) NSString *resourceURI;
@property (nonatomic, copy) NSString *name;

+ (NSDictionary*) elementosApropiedadMapping;

@end

NS_ASSUME_NONNULL_END
