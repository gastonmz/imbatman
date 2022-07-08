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
@import SDWebImage;

@interface DamianWayne ()

@end

NSUserDefaults* defaultsDW;

@implementation DamianWayne

@synthesize idCaracter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    [_textoCarrera setText:@"SU CARRERA HEROICA COMO TAL..."];

    
    // Configura Nombre de Heroe
    [_labelNombre setText:@"NOMBRE DEL HEROE"];
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

    
    [_labelCarreraTotalSeries setText:@"999"];
    [_labelCarreraTotalEventos setText:@"999"];
    [_labelCarreraTotalComics setText:@"999"];
    [_labelCarreraTotalHistorias setText:@"999"];
    
    [_imagenHeroe setContentMode:UIViewContentModeScaleAspectFit];
    [_imagenHeroe setClipsToBounds:YES];
    //[_imagenHeroe setFrame:CGRectMake(0,  _imagenFondoHeroe.frame.origin.y, _imagenHeroe.frame.size.width, _imagenHeroe.frame.size.height)];
    
}

- (void) obtieneHeroe {
    
    (void)[[charactersConductor alloc] init];
    [charactersConductor obtieneCaracter:[idCaracter intValue]  bloque:^(BOOL exito, characters* resultados, NSError* problemas) {
        // averga...
        if (problemas) {
            // ver que hacemos con el error
        }
        if (exito) {
            
            [self->_labelNombre setText:resultados.data.results[0].name];
            [self->_labelDetalle setText:[resultados.data.results[0].description isEqualToString:@""]  ? NO_HAY_DETALLE : resultados.data.results[0].description];
            [self->_imagenHeroe sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@.%@", resultados.data.results[0].thumbnail.path,  resultados.data.results[0].thumbnail.extension]]
                                  placeholderImage:[UIImage imageNamed:@"sinFoto"]];


            

       }

    }];
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
