//
//  ahiVamos.m
//  Im Batman
//
//  Created by Gaston Mz on 14/07/2022.
//

#import "ahiVamos.h"
@import Lottie;

UIView* laAnimacionVista;

@implementation ahiVamos


+(void)animame: (UIViewController*) donde {
    
    laAnimacionVista = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PANTALLA_LARGO, PANTALLA_ALTO)];
    
    UIView* fondoNegro = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PANTALLA_LARGO, PANTALLA_ALTO)];
    [fondoNegro setBackgroundColor:[UIColor blackColor]];
    [fondoNegro setAlpha:0.9f];
    
    LOTAnimationView *animacion = [LOTAnimationView animationFromJSON:[common JSONFromFile:ANIMACION_JSON]];
    animacion.animationSpeed = 1;
    animacion.frame = CGRectMake((PANTALLA_LARGO - ANIMACION_LARGO)/2, (PANTALLA_ALTO - ANIMACION_ALTO - TEXTO_ALTO)/2, ANIMACION_LARGO, ANIMACION_LARGO);
    animacion.contentMode = UIViewContentModeScaleAspectFit;
    animacion.loopAnimation = YES;
    [animacion play];
    
    UILabel* ahiVamos = [[UILabel alloc] initWithFrame:CGRectMake(animacion.frame.origin.x, animacion.frame.origin.y + ANIMACION_ALTO, animacion.frame.size.width, TEXTO_ALTO)];
    [ahiVamos setTextColor:[UIColor whiteColor]];
    [ahiVamos setText:@"AHI VAMOS . . ."];
    [ahiVamos setFont:[UIFont fontWithName:@"KomikaDisplayTight" size:20.0f]];
    [ahiVamos setTextAlignment:NSTextAlignmentCenter];
    
    [laAnimacionVista addSubview:fondoNegro];
    [laAnimacionVista addSubview:animacion];
    [laAnimacionVista addSubview:ahiVamos];
   
    [donde.view addSubview:laAnimacionVista];
}

+(void)desAnimame: (UIViewController*) donde {
    
    [laAnimacionVista removeFromSuperview];
    
}
@end
