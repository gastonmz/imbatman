//
//  DamianWayne.m
//  Im Batman
//
//  Created by Gaston Mz on 07/07/2022.
//

#import "DamianWayne.h"
#import "RestKit/RestKit.h"
#import "common.h"
#import "../Objetos/characters.h"
#import "../Characters/charactersConductor.h"
#import "../Core/ahiVamos.h"

@import SDWebImage;

@interface DamianWayne ()

@end

NSUserDefaults* defaultsDW;

@implementation DamianWayne

@synthesize idCaracter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [ahiVamos animame:self];

    
    [self initConfig];
    [self obtieneHeroe];
    
}

- (void) initConfig {
    
    defaultsDW = [NSUserDefaults standardUserDefaults];

    // Re-acomoda el contenido del scrollview
    [_scrollview setContentSize:CGSizeMake(_scrollview.frame.size.width, _scrollview.frame.origin.y + _vistaCarrera.frame.origin.y + _vistaCarrera.frame.size.height + 80.0f)];
    
    // Textos fijos en labels y botones
    [_labelCarreraTotalComics setText:@""];
    [_labelCarreraTotalSeries setText:@""];
    [_labelCarreraTotalEventos setText:@""];
    [_labelCarreraTotalHistorias setText:@""];
    [_labelNombre setText:@""];
     
    [_labelVolver setText:@"< VOLVAMOS"];
    [_labelCarreraSeries setText:@"SERIES"];
    [_labelCarreraEventos setText:@"EVENTOS"];
    [_labelCarrerasComics setText:@"COMICS"];
    [_labelCarreraHistorias setText:@"HISTORIAS"];

    [_labelCarreraSeries setBackgroundColor:[UIColor whiteColor]];
    [_labelCarreraEventos setBackgroundColor:[UIColor whiteColor]];
    [_labelCarrerasComics setBackgroundColor:[UIColor whiteColor]];
    [_labelCarreraHistorias setBackgroundColor:[UIColor whiteColor]];

    [_textoCarrera setText:@"SU CARRERA HEROICA COMO TAL..."];

    
    // Configura Nombre de Heroe
    [_labelNombre setText:@""];
    [_labelNombre setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:30]];
    _labelNombre.numberOfLines = 1;
    _labelNombre.adjustsFontSizeToFitWidth = YES;
    [_labelNombre setMinimumScaleFactor:30.0f/40.0f];
    [_labelNombre.superview layoutSubviews];
    
    // Configura Carrera
    [_textoCarrera setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:18]];
    [_textoCarrera setTextColor:[UIColor whiteColor]];
    CGAffineTransform tSDLF = _textoCarrera.transform;
    tSDLF = CGAffineTransformConcat(CGAffineTransformTranslate(tSDLF, 2, -8),CGAffineTransformRotate(tSDLF, -0.05));
    _textoCarrera.transform = tSDLF;
    
    // Configura textos de Carreras
    [_labelCarreraSeries setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:11]];
    [_labelCarreraEventos setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:11]];
    [_labelCarrerasComics setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:11]];
    [_labelCarreraHistorias setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:11]];
    [_labelCarreraTotalSeries setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:14]];
    [_labelCarreraTotalEventos setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:14]];
    [_labelCarreraTotalComics setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:14]];
    [_labelCarreraTotalHistorias setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:14]];
    [_labelVolver setFont:[UIFont fontWithName:@"KomikaDisplayTight" size:22]];
    [_labelDetalle setFont:[UIFont fontWithName:@"CrimeFighterBB" size:12]];
    
    [_labelCarreraTotalSeries setText:@""];
    [_labelCarreraTotalEventos setText:@""];
    [_labelCarreraTotalComics setText:@""];
    [_labelCarreraTotalHistorias setText:@""];
    
    [_imagenHeroe setContentMode:UIViewContentModeScaleAspectFit];
    [_imagenHeroe setClipsToBounds:YES];
    //[_imagenHeroe setFrame:CGRectMake(0,  _imagenFondoHeroe.frame.origin.y, _imagenHeroe.frame.size.width, _imagenHeroe.frame.size.height)];

    // Configura imagen volver con un tap
    UITapGestureRecognizer *tapVolver = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(volver:)];
    [tapVolver setNumberOfTapsRequired:1];
    [_labelVolver setUserInteractionEnabled:YES];
    [tapVolver setDelegate:self];
    [_labelVolver addGestureRecognizer:tapVolver];

}

- (void) volver: (UITapGestureRecognizer*)gesture {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:self.origen];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:NO completion:nil];
    
 }

- (void) obtieneHeroe {
    
    (void)[[charactersConductor alloc] init];
    [charactersConductor obtieneCaracter:[idCaracter intValue]  bloque:^(BOOL exito, characters* resultados, NSError* problemas) {
        // averga...
        if (problemas) {
            // ver que hacemos con el error
        }
        if (exito) {
            
            // Muestra info del hereo
            NSString* imagen = [NSString stringWithFormat:@"%@.%@", resultados.data.results[0].thumbnail.path,  resultados.data.results[0].thumbnail.extension];
            
            [self->_labelNombre setText:resultados.data.results[0].name];
            [self->_labelDetalle setText:[resultados.data.results[0].description isEqualToString:@""]  ? NO_HAY_DETALLE : resultados.data.results[0].description];
            [self->_imagenHeroe sd_setImageWithURL:[NSURL URLWithString:imagen]
                                  placeholderImage:[UIImage imageNamed:@"sinFoto"]];

            [self guardarHeroe:[resultados.data.results[0].id intValue] nombre:resultados.data.results[0].name imagen:imagen];
            
//[self obtieneCaraturlas:resultados.data.results[0].comics[0].items[0].resourceURI];
            
            // Procesa caratulas de su carrera Heroica
            
            // Comics
            self->_labelCarreraTotalComics.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].comics[0].available];
            if ([resultados.data.results[0].comics[0].available intValue] > 0) {
                [self muestraCaratula:resultados.data.results[0].comics[0].items[0].resourceURI imageView:self->_fondoCarreraComics];
            }
            
            // Series
            self->_labelCarreraTotalSeries.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].series[0].available];
            if ([resultados.data.results[0].series[0].available intValue] > 0) {
                [self muestraCaratula:resultados.data.results[0].series[0].items[0].resourceURI imageView:self->_fondoCarreraSeries];
            }

            // Historias
            self->_labelCarreraTotalHistorias.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].stories[0].available];
            if ([resultados.data.results[0].stories[0].available intValue] > 0) {
                [self muestraCaratula:resultados.data.results[0].stories[0].items[0].resourceURI imageView:self->_fondoCarreraHistorias];
            }

            // Eventos
            self->_labelCarreraTotalEventos.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].events[0].available];
            if ([resultados.data.results[0].events[0].available intValue] > 0) {
                [self muestraCaratula:resultados.data.results[0].events[0].items[0].resourceURI imageView:self->_fondoCarreraEventos];
            }

            // resultados.data.results[0].comics[0].available
            // resultados.data.results[0].comics[0].items[0].resourceURI
       }

        [ahiVamos desAnimame];

    }];
}

- (void) guardarHeroe: (int)idHeroe nombre:(NSString*)nombre imagen:(NSString*)imagen {
    
    NSMutableArray* heroesGuardados = [[NSMutableArray alloc] initWithArray:[defaultsDW objectForKey:@"heroesGuardados"]];

    if (![self existeHeroe:idHeroe libreria:heroesGuardados]) {
        
        // si tiene los 4 heroes guardados elimina el primero
        if ([heroesGuardados count] >= 3) {
            [heroesGuardados removeObjectAtIndex:0];
        }
        
        // Guarda Heroe
        NSMutableDictionary* heroe = [[NSMutableDictionary alloc] init];
        [heroe setObject:[NSNumber numberWithInt:idHeroe] forKey:@"id"];
        [heroe setObject:nombre forKey:@"nombre"];
        [heroe setObject:imagen forKey:@"imagen"];
        [heroesGuardados addObject:heroe];
        [defaultsDW setObject:heroesGuardados forKey:@"heroesGuardados"];
        
 
    }
}

- (BOOL) existeHeroe: (int)idHeroe libreria:(NSArray*)libreria {
    
    if (libreria) {
        for (int i = 0; i < [libreria count]; i++) {
            if ([[[libreria objectAtIndex:i] objectForKey:@"id"] intValue] == idHeroe) {
                return YES;
            }
        }
        return NO;
    } else {
        return NO;
    }

}

- (void) muestraCaratula:(NSString *)url imageView:(UIImageView*)imageView{
    
    NSString* ts = TIME_STAMP;
    NSString* urlCompleta = [NSString stringWithFormat:@"%@?apikey=%@&hash=%@&ts=%@",url,MARVEL_PUBLIC_KEY,[common createMarvelHash:ts],ts];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlCompleta]
              completionHandler:^(NSData *data,
                                  NSURLResponse *response,
                                  NSError *error) {
                // handle response
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);

        NSError * jsonError = nil;
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
         if (jsonError) {
            NSLog(@"%@", jsonError);
         } else {

             NSString* p = [[[[[dictionary objectForKey:@"data"] objectForKey:@"results"] objectAtIndex:0] objectForKey:@"thumbnail"] valueForKey:@"path"];
             NSString* e = [[[[[dictionary objectForKey:@"data"] objectForKey:@"results"] objectAtIndex:0] objectForKey:@"thumbnail"] valueForKey:@"extension"];
             NSString* laCaratula = [NSString stringWithFormat:@"%@.%@",p,e];
             
             [imageView sd_setImageWithURL:[NSURL URLWithString:laCaratula]
                          placeholderImage:[UIImage imageNamed:@"sinFoto"]];
             

         }
        
      }] resume];

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
