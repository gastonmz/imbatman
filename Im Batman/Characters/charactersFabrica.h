//
//  charactersFabrica.h
//  Im Batman
//
//  Created by Gaston Mz on 20/06/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"
#import "../Core/common.h"
#import "../Objetos/characters.h"

#define _MAPPING_CHARACTER @"data"
#define _MAPPING_CHARACTER_DATA @"results"
#define _MAPPING_CHARACTER_DATA_RESULTS_URL @"urls"
#define _MAPPING_CHARACTER_DATA_RESULTS_THUMB @"thumbnail"
#define _MAPPING_CHARACTER_DATA_RESULTS_EVENTS @"events"
#define _MAPPING_CHARACTER_DATA_RESULTS_STORIES @"stories"
#define _MAPPING_CHARACTER_DATA_RESULTS_SERIES @"series"
#define _MAPPING_CHARACTER_DATA_RESULTS_COMICS @"comics"
#define _MAPPING_CHARACTER_DATA_RESULTS_PROP @"items"

NS_ASSUME_NONNULL_BEGIN

@interface charactersFabrica : NSObject

+ (instancetype) compartidoCharacters;
+ (RKObjectMapping *) respuestaMapping;

@end

NS_ASSUME_NONNULL_END
