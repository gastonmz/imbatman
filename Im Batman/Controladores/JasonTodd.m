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
#import "DamianWayne.h"
#import "../Core/ahiVamos.h"

@import SDWebImage;
@import Lottie;

@interface JasonTodd ()

@end

NSUserDefaults* defaults;

@implementation JasonTodd


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [ahiVamos animame:self];
    
    [self initConfig];
    [self HeroeDelDia];
    [self cargaHeroesGuardados];
    
    
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
    
    // Configura botones
    [_botonBH.titleLabel setFont:[UIFont fontWithName:@"CrimeFighterBB" size:12]];
    [_botonBH.titleLabel setTextColor:[UIColor blackColor]];
    [_botonHDD.titleLabel setFont:[UIFont fontWithName:@"CrimeFighterBB" size:12]];
    [_botonHDD.titleLabel setTextColor:[UIColor blackColor]];
    
    // Configura Fuentes y etiquetas
    [_labelTextoBH setFont:[UIFont fontWithName:@"CrimeFighterBB" size:10]];
    [_labelBotonLH setFont:[UIFont fontWithName:@"CrimeFighterBB" size:11]];
    [_labelDetalleHDD setFont:[UIFont fontWithName:@"CrimeFighterBB" size:11]];
    
    [_labelNombreHDD setFont:[UIFont fontWithName:@"KomikaDisplayTight" size:40]];
    _labelNombreHDD.numberOfLines = 1;
    _labelNombreHDD.adjustsFontSizeToFitWidth = YES;
    [_labelNombreHDD setMinimumScaleFactor:20.0f/40.0f];
    [_labelNombreHDD.superview layoutSubviews];
    
    //Configura imagen Heroe del Dia
    [_imagenHeroeDelDia setContentMode:UIViewContentModeScaleAspectFit];
    [_imagenHeroeDelDia setBackgroundColor:[UIColor clearColor]];
    
    // Configura Salon de la fama
    
    NSMutableParagraphStyle *estilo =  [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    estilo.alignment = NSTextAlignmentJustified;
    estilo.firstLineHeadIndent = 5.0f;

    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:@"SUPER HEROE XXX BLA BLA BLA" attributes:@{ NSParagraphStyleAttributeName : estilo}];

    _labelSDLF01.attributedText = attrText;
    
 //   [_labelSDLF01 setText:@"SUPER HEROE XXX BLA BLA BLA"];

    [_imagenSDLF01 setBackgroundColor:[UIColor clearColor]];
    [_imagenSDLF02 setBackgroundColor:[UIColor clearColor]];
    [_imagenSDLF03 setBackgroundColor:[UIColor clearColor]];

    [_labelSDLF01 setFont:[UIFont fontWithName:@"KomikaDisplayTight" size:11]];
    [_labelSDLF02 setFont:[UIFont fontWithName:@"KomikaDisplayTight" size:11]];
    [_labelSDLF03 setFont:[UIFont fontWithName:@"KomikaDisplayTight" size:11]];
    [_labelSDLF01 setTextColor:[UIColor whiteColor]];
    [_labelSDLF02 setTextColor:[UIColor whiteColor]];
    [_labelSDLF03 setTextColor:[UIColor whiteColor]];
    [_labelSDLF01 setBackgroundColor:[UIColor colorWithRed:94.0f/255.0f green:23.0f/255.0f blue:135.0f/255.0f alpha:0.7]];
    [_labelSDLF02 setBackgroundColor:[UIColor colorWithRed:94.0f/255.0f green:23.0f/255.0f blue:135.0f/255.0f alpha:0.7]];
    [_labelSDLF03 setBackgroundColor:[UIColor colorWithRed:94.0f/255.0f green:23.0f/255.0f blue:135.0f/255.0f alpha:0.7]];




    
    // Configura acciones del campo de texto
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bajameElTeclado)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
    _textoBH.delegate = self;

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
                
                // chequeamos que al menos consigamos un heroe con data... sino buscamos de nuevo...
                if ([resultados.data.results[0].description isEqualToString:@""]) {
                    [self HeroeDelDia];
                } else {
                    NSMutableDictionary* heroe = [[NSMutableDictionary alloc] init];
                    [heroe setValue:resultados.data.results[0].id forKey:@"id"];
                    [heroe setValue:resultados.data.results[0].name forKey:@"nombre"];
                    [heroe setValue:resultados.data.results[0].description forKey:@"detalle"];
                    [heroe setValue:[NSString stringWithFormat:@"%@.%@", resultados.data.results[0].thumbnail.path,  resultados.data.results[0].thumbnail.extension] forKey:@"imagen"];
                    NSDateFormatter *formateo = [[NSDateFormatter alloc] init];
                    [formateo setDateFormat:@"dd-MM-yyyy"];
                    NSDate *fecha = [NSDate date];
                    [heroe setObject:[formateo stringFromDate:fecha] forKey:@"fecha"];

                    [defaults setObject:heroe forKey:@"HeroeDelDia"];
                    
                    [self muestraHeroeDelDia];
                }
            }
    
        }];
        
    } else {
        if ((BOOL)[self esTiempoDeCambiarDeHeroe:[[defaults objectForKey:@"HeroeDelDia"] objectForKey:@"fecha"]]) {
            [defaults removeObjectForKey:@"HeroeDelDia"];
            [self HeroeDelDia];
        } else {
            [self muestraHeroeDelDia];
        }
    }
}

- (BOOL) esTiempoDeCambiarDeHeroe:(NSString*)fechaGuardada {
        
    // Verifica si paso el dia y cambia de Heroe del dia
    NSDateFormatter *formateo = [[NSDateFormatter alloc] init];
    [formateo setDateFormat:@"dd-MM-yyyy"];
    NSDate *fecha = [NSDate date];
    NSString *fechaHoy = [formateo stringFromDate:fecha];
   
    NSDate *inicio = [formateo dateFromString:fechaGuardada];
    NSDate *fin = [formateo dateFromString:fechaHoy];

    NSCalendar *calendario = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *respuesta = [calendario components:NSCalendarUnitDay
                                                        fromDate:inicio
                                                          toDate:fin
                                                         options:0];
    
    return respuesta.day == 0 ? NO : YES;

}

- (void) muestraHeroeDelDia {

    NSDictionary* heroe = [[NSDictionary alloc] initWithDictionary:[defaults objectForKey:@"HeroeDelDia"]];
    [_labelNombreHDD setText:[[heroe valueForKey:@"nombre"] uppercaseString]];
    [_labelDetalleHDD setText:[[heroe valueForKey:@"detalle"] isEqualToString:@""] ? NO_HAY_DETALLE : [heroe valueForKey:@"detalle"]];
    [_imagenHeroeDelDia sd_setImageWithURL:[heroe valueForKey:@"imagen"]
                          placeholderImage:[UIImage imageNamed:@"sinFoto"]];
    
    [ahiVamos desAnimame];

}

- (void) cargaHeroesGuardados {
    
    NSMutableArray* heroesGuardados = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"heroesGuardados"]];

    for (int i = 0; i < [heroesGuardados count]; i++) {
        UILabel* lNombre = (UILabel *)[self.view viewWithTag:(i+1)*100];
        UIImageView* iImagen = (UIImageView*)[self.view viewWithTag:(i+1)*10];
        
        [lNombre setText:[[heroesGuardados objectAtIndex:i] objectForKey:@"nombre"]];
        [iImagen sd_setImageWithURL:[[heroesGuardados objectAtIndex:i] objectForKey:@"imagen"]];
        
    }
    
}

- (void)bajameElTeclado
{
     [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation
 
 

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buscarHeroes:(id)sender {
    
}

- (IBAction)verHeroeDelDia:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DamianWayne *vc = [storyboard instantiateViewControllerWithIdentifier:@"DamianWayne"];
    vc.idCaracter = (NSNumber*)[[defaults objectForKey:@"HeroeDelDia"] valueForKey:@"id"];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:NO completion:nil];
    
}
@end
