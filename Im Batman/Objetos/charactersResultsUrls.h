//
//  charactersResultsUrls.h
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import <Foundation/Foundation.h>

#define charactersURLdetailsDETAILS @"details"
#define charactersURLdetailsWIKI @"wiki"
#define charactersURLdetailsCOMICLINK @"comiclink"

NS_ASSUME_NONNULL_BEGIN

@interface charactersResultsUrls : NSObject
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;

+ (NSDictionary*) elementosApropiedadMapping;

@end

NS_ASSUME_NONNULL_END
