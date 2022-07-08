//
//  DamianWayne.h
//  Im Batman
//
//  Created by Gaston Mz on 07/07/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DamianWayne : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *fondo;
@property (weak, nonatomic) IBOutlet UIImageView *nubeSuperior;
@property (weak, nonatomic) IBOutlet UIImageView *nubeInferior;
@property (weak, nonatomic) IBOutlet UIImageView *imagenVolver;
@property (weak, nonatomic) IBOutlet UILabel *labelVolver;
@property (weak, nonatomic) IBOutlet UIImageView *imagenBurbuja;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIImageView *imagenFondoHeroe;
@property (weak, nonatomic) IBOutlet UIImageView *imagenHeroe;
@property (weak, nonatomic) IBOutlet UIImageView *imagenFondoNombre;
@property (weak, nonatomic) IBOutlet UILabel *labelNombre;
@property (weak, nonatomic) IBOutlet UIImageView *imagenFondoDetalle;
@property (weak, nonatomic) IBOutlet UILabel *labelDetalle;

@property (weak, nonatomic) IBOutlet UIView *vistaCarrera;
@property (weak, nonatomic) IBOutlet UIImageView *imagenFondoCarrera;
@property (weak, nonatomic) IBOutlet UILabel *textoCarrera;

@property (weak, nonatomic) IBOutlet UIImageView *imagenFondoCarreraCuadros;
@property (weak, nonatomic) IBOutlet UIImageView *fondoCarreraComics;
@property (weak, nonatomic) IBOutlet UIImageView *fondoCarreraSeries;
@property (weak, nonatomic) IBOutlet UIImageView *fondoCarreraHistorias;
@property (weak, nonatomic) IBOutlet UIImageView *fondoCarreraEventos;
@property (weak, nonatomic) IBOutlet UILabel *labelCarrerasComics;
@property (weak, nonatomic) IBOutlet UILabel *labelCarreraSeries;
@property (weak, nonatomic) IBOutlet UILabel *labelCarreraHistorias;
@property (weak, nonatomic) IBOutlet UILabel *labelCarreraEventos;
@property (weak, nonatomic) IBOutlet UILabel *labelCarreraTotalComics;
@property (weak, nonatomic) IBOutlet UILabel *labelCarreraTotalSeries;
@property (weak, nonatomic) IBOutlet UILabel *labelCarreraTotalHistorias;
@property (weak, nonatomic) IBOutlet UILabel *labelCarreraTotalEventos;

// Propiedades personzalizadas
@property (strong, nonatomic) NSNumber* idCaracter;

@end

NS_ASSUME_NONNULL_END
