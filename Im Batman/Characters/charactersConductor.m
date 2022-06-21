//
//  charactersConductor.m
//  Im Batman
//
//  Created by Gaston Mz on 20/06/2022.
//

#import "charactersConductor.h"
#import "charactersFabrica.h"

@implementation charactersConductor

static charactersConductor *compartidoConductor = nil;

- (id) init{
    self = [super init];
    if (self) {
        [self inicializaFabrica];

        if (nil == compartidoConductor) {
            [charactersConductor setcharactersConductor:self];
        }
    }
    return self;
}


- (void) inicializaFabrica {
    (void)[[charactersFabrica alloc] init];
}

+ (void) listaReducida:(int)limite
               paginas:(int)paginas
            empiezaCon:(NSString*)empiezaCon
                bloque:(void (^) (BOOL exito, characters *resultado, NSError *error))completado {
    
    // Genera parametros
    NSString* ts = TIME_STAMP;
    NSMutableDictionary* parametros = [[NSMutableDictionary alloc] init];
    // fijos
    [parametros setValue:MARVEL_PUBLIC_KEY forKey:@"apikey"];
    [parametros setValue:ts forKey:@"ts"];
    [parametros setValue:[common createMarvelHash:ts] forKey:@"hash"];
    [parametros setValue:@"name" forKey:@"orderBy"];
    // opcionales
    (limite) ? [parametros setValue:[NSNumber numberWithInt:limite] forKey:@"limit"] : nil;
    (empiezaCon) ? [parametros setValue:empiezaCon forKey:@"nameStartsWith"] : nil;
    int paginacion = (paginas) ? (limite * (paginas - 1)) : 0;
    (paginacion > 0) ? [parametros setValue:[NSNumber numberWithInt:paginacion] forKey:@"offset"] : nil;

    characters * modelo = [[characters alloc] init];
    [[RKObjectManager sharedManager] getObject:modelo
                                          path:nil
                                    parameters:parametros
                                       success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                            NSLog(@"yes");
                                            characters *objetos = [mappingResult firstObject];
                                            completado(YES, objetos,  nil);
                                       }
                                       failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                            NSLog(@"no");
                                            // La mala onda misma...
                                            completado(NO, nil, error);
                                       }];
}

#pragma mark - Characters Conductor

+ (void)setcharactersConductor:(charactersConductor *)conduc {
    compartidoConductor = conduc;
}

+ (instancetype) compartidoConductor {
    return compartidoConductor;
}
@end
