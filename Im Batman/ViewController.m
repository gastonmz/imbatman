//
//  ViewController.m
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import "ViewController.h"
#import "RestKit/RestKit.h"
#import "common.h"
#import "Objetos/characters.h"
#import "Characters/charactersConductor.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  
   (void)[[charactersConductor alloc] init];
    [charactersConductor listaReducida:5 paginas:2 empiezaCon:@"r" bloque:^(BOOL exito, characters* resultados, NSError* problemas) {
        // averga...
        for (int x = 0; x < resultados.data.results.count; x++) {
            NSLog(@"%i - %@",x, resultados.data.results[x].name);
        }
        
    }];
    
    
    
    
    
}




@end
