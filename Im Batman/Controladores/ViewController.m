//
//  ViewController.m
//  Im Batman
//
//  Created by Gaston Mz on 18/06/2022.
//

#import "ViewController.h"
#import "RestKit/RestKit.h"
#import "common.h"
#import "../Objetos/characters.h"
#import "../Characters/charactersConductor.h"
#import "JasonTodd.h"


@interface ViewController ()

@end


@implementation ViewController

@synthesize nubesBase;
@synthesize fondoInicio;
@synthesize explosion;
@synthesize bang;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  

    [self BoludeamosUnPocoConLaIntro];
    
    SDAnimatedImageView *imageView = [SDAnimatedImageView new];
    SDAnimatedImage *animatedImage = [SDAnimatedImage imageNamed:@"image.gif"];
    imageView.image = animatedImage;
    
    UILabel* esperame = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 30)];
    [esperame setText:@""];
    [self.view addSubview:esperame];
   
    
}

-(void) chupito:(UIButton*)sender{
    
    (void)[[charactersConductor alloc] init];
    [charactersConductor obtieneLista:5 paginas:2 empiezaCon:@"r" bloque:^(BOOL exito, characters* resultados, NSError* problemas) {
        // averga...
        for (int x = 0; x < resultados.data.results.count; x++) {
            NSLog(@"%i - %@",x, resultados.data.results[x].name);
        }

    }];
    
    
}

- (void) BoludeamosUnPocoConLaIntro {
    
    // no veo nada
    [nubesBase setAlpha:0.0f];
    [explosion setAlpha:0.0f];
    [bang setAlpha:0.0f];
    // guardo lo que necesito
    float nubesPosicionY = nubesBase.frame.origin.y;
    [nubesBase setFrame:CGRectMake(nubesBase.frame.origin.x, PANTALLA_ALTO + nubesBase.frame.size.height, nubesBase.frame.size.width, nubesBase.frame.size.height)];
    explosion.frame = [self centrarImagen:bang paAbajo:YES];
    bang.frame = [self centrarImagen:bang paAbajo:NO];
    
    // Ultima boludez primero...
    void (^bangeamela)(void) = ^{
        [UIView animateWithDuration:0.1f
                              delay:0.2f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                                    [self.explosion setAlpha:0.0f];
                                    [self.bang setAlpha:1.0f];
                         }
                         completion:^(BOOL finished) {
                           // Carga Principal
                                [self _showTransitionA];
                        }];
      };
    
    // Segunda boludez, segundo...
    void (^subimela)(void) = ^{
        [UIView animateWithDuration:0.3f
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                            self.explosion.frame = [self centrarImagen:self.explosion paAbajo:NO];
                            [self.explosion setAlpha:1.0f];
                         }
                         completion:^(BOOL finished) {
                            bangeamela();
                        }];
      };
      
      // Acá arrancamos
      [UIView animateWithDuration:0.5f
                            delay:0.0f
                          options:UIViewAnimationOptionCurveEaseIn
                       animations:^{
                              [self.nubesBase setFrame:CGRectMake(self->nubesBase.frame.origin.x, nubesPosicionY, self->nubesBase.frame.size.width, self->nubesBase.frame.size.height)];
                              [self.nubesBase setAlpha:1.0f];
                       }
                       completion:^(BOOL finished) {
                           subimela();
                       }];
}

- (CGRect) centrarImagen: (UIImageView*)im paAbajo:(BOOL)paAbajo{
    return CGRectMake((self.view.frame.size.width / 2) - (im.frame.size.width / 2),(paAbajo) ? PANTALLA_ALTO + im.frame.size.height : (self.view.frame.size.height / 2) - (im.frame.size.height / 2), im.frame.size.width, im.frame.size.height);
}
//
- (void)_showTransitionA {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                 @"Main" bundle:[NSBundle mainBundle]];
     UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:ORIGEN_HOME];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
     [self presentViewController:vc animated:NO completion:nil];
    
//    ViewController2 *vc = [[ViewController2 alloc] init];
//    vc.modalPresentationStyle = UIModalPresentationFullScreen;
////  vc.transitioningDelegate = self;
//  [self presentViewController:vc animated:NO completion:NULL];
}

#pragma mark -- View Controller Transitioning

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
  LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"Count" fromLayerNamed:@"" toLayerNamed:@"" applyAnimationTransform:NO];
  return animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
  LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"Three" fromLayerNamed:@"" toLayerNamed:@"" applyAnimationTransform:NO];
  return animationController;
}

@end

