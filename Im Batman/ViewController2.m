//
//  ViewController2.m
//  Im Batman
//
//  Created by Gaston Mz on 21/06/2022.
//

#import "ViewController2.h"
#import "RestKit/RestKit.h"
#import "common.h"
#import "Objetos/characters.h"
#import "Characters/charactersConductor.h"


@interface ViewController2 ()

@end

@implementation ViewController2

@synthesize aaa;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  ///  [aaa setImage:[UIImage imageNamed:@"fondo_02.pdf"]];
    
    
    UIButton* bb = [[UIButton alloc] initWithFrame:CGRectMake(10, 190, 200, 50)];
    [bb setTitle:@"solo uno" forState:UIControlStateNormal];
    [bb setBackgroundColor:[UIColor greenColor]];
    [bb setExclusiveTouch:YES];

    [bb addTarget:self
               action:@selector(chupala:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bb];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//1009738

- (void) chupala:(UIButton*)sender {
    (void)[[charactersConductor alloc] init];
    [charactersConductor obtieneCaracter:1009487  bloque:^(BOOL exito, characters* resultados, NSError* problemas) {
        // averga...
        for (int x = 0; x < resultados.data.results.count; x++) {
            NSLog(@"%i - %@",x, resultados.data.results[x].name);
        }
        
    }];
}
@end
