//
//  charactersFabrica.m
//  Im Batman
//
//  Created by Gaston Mz on 20/06/2022.
//

#import "charactersFabrica.h"


@implementation charactersFabrica

static charactersFabrica *compartidoCharacters = nil;

- (id) init{
    self = [super init];
    if (self) {
        [self inicializaObjectManager];

        if (nil == compartidoCharacters) {
            [charactersFabrica setcompartidoCharacters:self];
        }
    }

    return self;
}

+ (RKObjectMapping *) mapeaListaCompletaDeCaracteres {

    // Mapea respuesta de caracteres obtenidos
    RKObjectMapping* characterMapping = [RKObjectMapping mappingForClass:[characters class]];
    [characterMapping addAttributeMappingsFromDictionary:[characters elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data
    RKObjectMapping* dataMapping = [RKObjectMapping mappingForClass:[charactersData class]];
    [dataMapping addAttributeMappingsFromDictionary:[charactersData elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data -> results
    RKObjectMapping* resultsMapping = [RKObjectMapping mappingForClass:[charactersResults class]];
    [resultsMapping addAttributeMappingsFromDictionary:[charactersResults elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data -> results -> thumbnail
    RKObjectMapping* thumbnailMapping = [RKObjectMapping mappingForClass:[charactersResultsThumbnail class]];
    [thumbnailMapping addAttributeMappingsFromDictionary:[charactersResultsThumbnail elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data -> results -> urls
    RKObjectMapping* urlsMapping = [RKObjectMapping mappingForClass:[charactersResultsUrls class]];
    [urlsMapping addAttributeMappingsFromDictionary:[charactersResultsUrls elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data -> results -> CSSE (comics/series/stories/events)
    RKObjectMapping* propsMapping = [RKObjectMapping mappingForClass:[charactersResultsProps class]];
    [propsMapping addAttributeMappingsFromDictionary:[charactersResultsProps elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data -> results -> CSSE -> items
    RKObjectMapping* propsItemsMapping = [RKObjectMapping mappingForClass:[charactersResultsPropsItems class]];
    [propsItemsMapping addAttributeMappingsFromDictionary:[charactersResultsPropsItems elementosApropiedadMapping]];

    // Crea relaciones de mapeos
    
    // items en CSSE
    [propsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_PROP
                                                                                 toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_PROP
                                                                               withMapping:propsItemsMapping]];
    // comics en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_COMICS
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_COMICS
                                                                                 withMapping:propsMapping]];
    // series en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_SERIES
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_SERIES
                                                                                 withMapping:propsMapping]];
    // stories en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_STORIES
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_STORIES
                                                                                 withMapping:propsMapping]];
    // events en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_EVENTS
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_EVENTS
                                                                                 withMapping:propsMapping]];
    // thumbnail en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_THUMB
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_THUMB
                                                                                 withMapping:thumbnailMapping]];
    // url en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_URL
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_URL
                                                                                 withMapping:urlsMapping]];
    // results en data
    [dataMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA
                                                                                 withMapping:resultsMapping]];
    // data en characters
    [characterMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER
                                                                                  toKeyPath:_MAPPING_CHARACTER
                                                                                 withMapping:dataMapping]];

    return characterMapping;
}

+ (RKObjectMapping *) mapeaListaReducidaDeCaracteres {

    // Mapea respuesta de caracteres obtenidos
    RKObjectMapping* characterMapping = [RKObjectMapping mappingForClass:[characters class]];
    [characterMapping addAttributeMappingsFromDictionary:[characters elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data
    RKObjectMapping* dataMapping = [RKObjectMapping mappingForClass:[charactersData class]];
    [dataMapping addAttributeMappingsFromDictionary:[charactersData elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data -> results
    RKObjectMapping* resultsMapping = [RKObjectMapping mappingForClass:[charactersResults class]];
    [resultsMapping addAttributeMappingsFromDictionary:[charactersResults elementosReducidosApropiedadMapping]];
    
    // Mapea respuesta de caracteres -> data -> results -> thumbnail
    RKObjectMapping* thumbnailMapping = [RKObjectMapping mappingForClass:[charactersResultsThumbnail class]];
    [thumbnailMapping addAttributeMappingsFromDictionary:[charactersResultsThumbnail elementosApropiedadMapping]];

    // Mapea respuesta de caracteres -> data -> results -> CSSE (comics/series/stories/events)
    RKObjectMapping* propsMapping = [RKObjectMapping mappingForClass:[charactersResultsProps class]];
    [propsMapping addAttributeMappingsFromDictionary:[charactersResultsProps elementosReducidosApropiedadMapping]];

    // Crea relaciones de mapeos
    
    // comics en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_COMICS
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_COMICS
                                                                                 withMapping:propsMapping]];
    // series en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_SERIES
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_SERIES
                                                                                 withMapping:propsMapping]];
    // stories en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_STORIES
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_STORIES
                                                                                 withMapping:propsMapping]];
    // events en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_EVENTS
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_EVENTS
                                                                                 withMapping:propsMapping]];
    // thumbnail en results
    [resultsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_THUMB
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA_RESULTS_THUMB
                                                                                 withMapping:thumbnailMapping]];
    // results en data
    [dataMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER_DATA
                                                                                  toKeyPath:_MAPPING_CHARACTER_DATA
                                                                                 withMapping:resultsMapping]];
    // data en characters
    [characterMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:_MAPPING_CHARACTER
                                                                                  toKeyPath:_MAPPING_CHARACTER
                                                                                 withMapping:dataMapping]];

    return characterMapping;
}


- (void) inicializaObjectManager {
    
    // Nivel de logueo
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);

    // Crea el ObjectManager
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:MARVEL_BASE_URL]];
    manager.requestSerializationMIMEType = RKMIMETypeJSON;
        
    // Configura Descriptor
    [manager addResponseDescriptor:
                   [RKResponseDescriptor
                       responseDescriptorWithMapping:[charactersFabrica mapeaListaReducidaDeCaracteres]
                                              method:RKRequestMethodGET
                                         pathPattern:MARVEL_API_CHARACTERS
                                             keyPath:@""
                                         statusCodes:
                                             RKStatusCodeIndexSetForClass(
                                                 RKStatusCodeClassSuccessful)]];
    
    // Conigura router
    [[manager router].routeSet
                    addRoutes:@[
                           [RKRoute routeWithClass:[characters class]
                                       pathPattern:MARVEL_API_CHARACTERS
                                            method:RKRequestMethodGET]]];
}

#pragma mark - Characters Fabrica

+ (void)setcompartidoCharacters:(charactersFabrica *)charact {
    compartidoCharacters = charact;
}

+ (instancetype) compartidoCharacters {
    return compartidoCharacters;
}

@end
