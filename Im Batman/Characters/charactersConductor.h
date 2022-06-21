//
//  charactersConductor.h
//  Im Batman
//
//  Created by Gaston Mz on 20/06/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"
#import "../Core/common.h"
#import "../Objetos/characters.h"


@interface charactersConductor : NSObject

+ (instancetype) compartidoConductor;
+ (void) listaReducida:(int)limite paginas:(int)paginas empiezaCon:(NSString*)empiezaCon bloque:(void (^) (BOOL exito, characters *resultado, NSError *error))completado;

@end

