//
//  ViewController.m
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import "ViewController.h"
#import "RestKit/RestKit.h"


#define MARVEL_PUBLIC_KEY @"d6c8ea9e3de2f070215b7c04853cd536"
#define MARVEL_PRIVATE_KEY @"ee32575f9c8f01fdb9ea5f3ace5e699e0e59468b"
#define MARVEL_BASE_URL @"developer.marvel.com"
#define MARVEL_ATTRIBUTION @"Data provided by Marvel. © 2014 Marvel"
#define MARVEL_API_CHARACTERS @"/v1/public/characters"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    
    // Initial setup
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://gastonmz.com"]];

    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[gmz class]];
    [mapping addAttributeMappingsFromDictionary:@{@"campo" : @"campo"}];
  //  [mapping addAttributeMappingsFromDictionary:@{@"otro" : @"otro"}];

    [manager addResponseDescriptor:
                   [RKResponseDescriptor
                       responseDescriptorWithMapping:mapping
                                              method:RKRequestMethodGET
                                         pathPattern:@"/imbatman/test.json"
                                             keyPath:@"inicio"
                                         statusCodes:
                                             RKStatusCodeIndexSetForClass(
                                                 RKStatusCodeClassSuccessful)]];

    [[manager router].routeSet
                    addRoutes:@[
                           [RKRoute routeWithClass:[gmz class]
                                       pathPattern:@"/imbatman/test.json"
                                            method:RKRequestMethodGET]]];


    gmz * modelObject = [[gmz alloc] init];

    [[RKObjectManager sharedManager] getObject:modelObject
                                          path:nil
                                    parameters:nil
                                       success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
                                        NSLog(@"yes");
                                            gmz *article = [mappingResult firstObject];
        
                                            NSLog(@"Mapped the article: %@", [[[mappingResult array] objectAtIndex:1] valueForKey:@"campo"]);
      //  NSLog(@"Mapped the article: %@", article.otro);
                                       }
                                       failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"no");
                                       }];
    
     
}




@end
