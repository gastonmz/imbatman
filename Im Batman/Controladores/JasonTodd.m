//
//  JasonTodd.m
//  Im Batman
//
//  Created by Gaston Mz on 04/07/2022.
//

#import "JasonTodd.h"
#import "RestKit/RestKit.h"
#import "common.h"
#import "../Objetos/characters.h"
#import "../Characters/charactersConductor.h"
@import SDWebImage;

@interface JasonTodd ()

@end

NSUserDefaults* defaults;

@implementation JasonTodd


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initConfig];
    [self HeroeDelDia];
}

- (void) initConfig {
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    // Blanquea por defecto
    [_labelSDLF01 setText:@""];
    [_labelSDLF02 setText:@""];
    [_labelSDLF03 setText:@""];
    [_labelNombreHDD setText:@""];
    [_labelDetalleHDD setText:@""];
        
    // Textos fijos en labels y botones
    [_labelTituloHDD setText:@"HEROE DEL DIA!"];
    [_labelTituloSDLF setText:@"MIENTRAS... EN EL SALON DE LA FAMA?"];
    [_botonBH setTitle:@"BUSCAR" forState:UIControlStateNormal];
    [_botonHDD setTitle:@"VER MAS" forState:UIControlStateNormal];
    [_labelTextoBH setText:@"si estas en apuros... y tu heroe del dia no llega a tiempo... \nBUSCA OTRO AQUI: "];
    [_labelBotonLH setText:@"Caracoles!\nno encuentras a tu heroe?\n\nlistalos aqui de la a la a z!\n->"];

    // Configura Heroe del Dia
    [_labelTituloHDD setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:24]];
    [_labelTituloHDD setTextColor:[UIColor whiteColor]];
    CGAffineTransform tHDD = _labelTituloHDD.transform;
    tHDD = CGAffineTransformConcat(CGAffineTransformTranslate(tHDD, 2, -5),CGAffineTransformRotate(tHDD, -0.07));
    _labelTituloHDD.transform = tHDD;
        
    // Configura Salon de la fama
    [_labelTituloSDLF setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:17]];
    [_labelTituloSDLF setTextColor:[UIColor whiteColor]];
    CGAffineTransform tSDLF = _labelTituloSDLF.transform;
    tSDLF = CGAffineTransformConcat(CGAffineTransformTranslate(tSDLF, 2, -8),CGAffineTransformRotate(tSDLF, -0.05));
    _labelTituloSDLF.transform = tSDLF;
    
    [_botonBH.titleLabel setFont:[UIFont fontWithName:@"CrimeFighterBB" size:12]];
    [_botonBH.titleLabel setTextColor:[UIColor blackColor]];
    [_botonHDD.titleLabel setFont:[UIFont fontWithName:@"CrimeFighterBB" size:12]];
    [_botonHDD.titleLabel setTextColor:[UIColor blackColor]];

    [_labelTextoBH setFont:[UIFont fontWithName:@"CrimeFighterBB" size:10]];

    


}

- (void) HeroeDelDia {
    
    
    if (![defaults objectForKey:@"HeroeDelDia"]) {

        // Obtiene un valor aleatorio de un heroe de Marvel
        unsigned int rnd = arc4random_uniform([HEROES_LISTA count]);
        NSString* randomLetra = [HEROES_LISTA objectAtIndex:rnd];
        NSNumber* randomIndice  = [HEROES_TOTAL objectAtIndex:rnd];

        (void)[[charactersConductor alloc] init];
        [charactersConductor obtieneLista:1 paginas:[randomIndice intValue] empiezaCon:randomLetra bloque:^(BOOL exito, characters* resultados, NSError* problemas) {
            // averga...
            if (problemas) {
                // ver que hacemos con el error
            }
            if (exito) {
                NSMutableDictionary* heroe = [[NSMutableDictionary alloc] init];
                [heroe setValue:resultados.data.results[0].id forKey:@"id"];
                [heroe setValue:resultados.data.results[0].name forKey:@"nombre"];
                [heroe setValue:resultados.data.results[0].description forKey:@"detalle"];
                [heroe setValue:[NSString stringWithFormat:@"%@.%@", resultados.data.results[0].thumbnail.path,  resultados.data.results[0].thumbnail.extension] forKey:@"imagen"];
                [defaults setObject:heroe forKey:@"HeroeDelDia"];
                
                [self muestraHeroeDelDia];
            }
    
        }];
        
    } else {
        [self muestraHeroeDelDia];
    }
    
    
}

- (void) muestraHeroeDelDia {

    NSDictionary* heroe = [[NSDictionary alloc] initWithDictionary:[defaults objectForKey:@"HeroeDelDia"]];
    [_labelNombreHDD setText:[heroe valueForKey:@"nombre"]];
    [_labelDetalleHDD setText:[heroe valueForKey:@"detalle"]];
    [_imagenHeroeDelDia sd_setImageWithURL:[heroe valueForKey:@"imagen"]
                          placeholderImage:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
