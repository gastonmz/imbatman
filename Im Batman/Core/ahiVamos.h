//
//  ahiVamos.h
//  Im Batman
//
//  Created by Gaston Mz on 14/07/2022.
//

#import <Foundation/Foundation.h>
#import "common.h"
@import UIKit;

#define ANIMACION_ALTO 140.0f
#define ANIMACION_LARGO 140.0f
#define TEXTO_ALTO 30.0f
#define ANIMACION_JSON @"flash_load"

NS_ASSUME_NONNULL_BEGIN

@interface ahiVamos : NSObject

+(void)animame: (UIViewController*) donde;
+(void)desAnimame;

@end

NS_ASSUME_NONNULL_END
