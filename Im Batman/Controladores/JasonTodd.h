//
//  JasonTodd.h
//  Im Batman
//
//  Created by Gaston Mz on 04/07/2022.
//

#import <UIKit/UIKit.h>

#define HEROES_LISTA @[@"3",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",]
#define HEROES_TOTAL @[@1,@84,@101,@104,@80,@34,@38,@62,@74,@41,@44,@36,@56,@156,@46,@23,@66,@9,@61,@202,@98,@21,@33,@60,@15,@6,@11]


NS_ASSUME_NONNULL_BEGIN

@interface JasonTodd : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *fondo;
@property (weak, nonatomic) IBOutlet UIImageView *imagenNube;
@property (weak, nonatomic) IBOutlet UIImageView *imagenBurbuja;
@property (weak, nonatomic) IBOutlet UIImageView *fondoTituloSDLF;
@property (weak, nonatomic) IBOutlet UILabel *labelTituloSDLF;
@property (weak, nonatomic) IBOutlet UIImageView *fondoTituloHDD;
@property (weak, nonatomic) IBOutlet UILabel *labelTituloHDD;

// Heroe del dia
@property (weak, nonatomic) IBOutlet UIImageView *fondoHeroeDelDia;
@property (weak, nonatomic) IBOutlet UIImageView *imagenHeroeDelDia;
@property (weak, nonatomic) IBOutlet UILabel *labelNombreHDD;
@property (weak, nonatomic) IBOutlet UILabel *labelDetalleHDD;
@property (weak, nonatomic) IBOutlet UIImageView *imagenBotonHDD;
@property (weak, nonatomic) IBOutlet UIButton *botonHDD;

// Buscar Heroe
@property (weak, nonatomic) IBOutlet UIImageView *fondoBuscarHeroe;
@property (weak, nonatomic) IBOutlet UILabel *labelTextoBH;
@property (weak, nonatomic) IBOutlet UIImageView *fondoTextoBH;
@property (weak, nonatomic) IBOutlet UITextField *textoBH;
@property (weak, nonatomic) IBOutlet UIImageView *imagenBotonBH;
@property (weak, nonatomic) IBOutlet UIButton *botonBH;

// Listar Heroes
@property (weak, nonatomic) IBOutlet UIImageView *fondoListarHeroes;
@property (weak, nonatomic) IBOutlet UIImageView *imagenBotonLH;
@property (weak, nonatomic) IBOutlet UILabel *labelBotonLH;

// Salon de la Fama
@property (weak, nonatomic) IBOutlet UIImageView *fondoSDLF01;
@property (weak, nonatomic) IBOutlet UIImageView *imagenSDLF01;
@property (weak, nonatomic) IBOutlet UILabel *labelSDLF01;

@property (weak, nonatomic) IBOutlet UIImageView *fondoSDLF02;
@property (weak, nonatomic) IBOutlet UIImageView *imagenSDLF02;
@property (weak, nonatomic) IBOutlet UILabel *labelSDLF02;

@property (weak, nonatomic) IBOutlet UIImageView *fondoSDLF03;
@property (weak, nonatomic) IBOutlet UIImageView *imagenSDLF03;
@property (weak, nonatomic) IBOutlet UILabel *labelSDLF03;

@end

NS_ASSUME_NONNULL_END
