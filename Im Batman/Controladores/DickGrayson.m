//
//  DickGrayson.m
//  Im Batman
//
//  Created by Gaston Mz on 31/07/2022.
//

#import "DickGrayson.h"
#import "RestKit/RestKit.h"
#import "common.h"
#import "../Objetos/characters.h"
#import "../Characters/charactersConductor.h"
#import "../Core/ahiVamos.h"

@import SDWebImage;

@interface DickGrayson ()

@end

NSUserDefaults* defaultsDG;
characters* resultadosDB;

@implementation DickGrayson

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [ahiVamos animame:self];

    [self initConfig];
    _tablaResultados.delegate = self;
  //  _tablaResultados.dataSource = self;

    if (![self.cadena isEqualToString:@""]) {
        [self buscarHeroes];
    }

}


- (void) initConfig {
    
    defaultsDG = [NSUserDefaults standardUserDefaults];

    
    // Textos fijos en labels y botones
    [_prefsCantidad setText:@"10"];
    [_labelResultados setText:@"ESTAS VIENDO 10 HEROES DE 200 QUE BUSCASTE COMO BATMAN"];
    [_labelVolver setText:@"< VOLVAMOS"];
    [_prefsLabel setText:@"QUE PREFIERES?"];
    [_prefsLabelBuscar setText:@"BUSCARLOS?"];
    [_prefsLabelFiltrar setText:@"FILTRAR LA LISTA?"];
    [_prefsLabelMostrar setText:@"SOLO\nMOSTRAR"];

    [_prefsCantidad setTextAlignment:NSTextAlignmentCenter];
    [_prefsLabelMostrar setTextAlignment:NSTextAlignmentCenter];
    [_labelResultados setTextAlignment:NSTextAlignmentCenter];

    // Configura fuentes
    [_prefsLabel setFont:[UIFont fontWithName:@"CCBiffBamBoom" size:20]];
    [_labelVolver setFont:[UIFont fontWithName:@"KomikaDisplayTight" size:22]];
    [_prefsCantidad setFont:[UIFont fontWithName:@"CrimeFighterBB" size:30]];
    [_labelResultados setFont:[UIFont fontWithName:@"CrimeFighterBB" size:11]];
    [_prefsLabelBuscar setFont:[UIFont fontWithName:@"CrimeFighterBB" size:11]];
    [_prefsLabelFiltrar setFont:[UIFont fontWithName:@"CrimeFighterBB" size:11]];
    [_prefsLabelMostrar setFont:[UIFont fontWithName:@"CrimeFighterBB" size:11]];

    // Configura imagen volver con un tap
    UITapGestureRecognizer *tapVolver = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(volver:)];
    [tapVolver setNumberOfTapsRequired:1];
    [_labelVolver setUserInteractionEnabled:YES];
    [tapVolver setDelegate:self];
    [_labelVolver addGestureRecognizer:tapVolver];
   
}

- (void) volver: (UITapGestureRecognizer*)gesture {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:ORIGEN_HOME];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:NO completion:nil];
    
 }

- (void) buscarHeroes {
    
    
    (void)[[charactersConductor alloc] init];
    [charactersConductor obtieneLista:10 paginas:1 empiezaCon:self.cadena bloque:^(BOOL exito, characters* resultados, NSError* problemas) {
        // averga...
        if (problemas) {
            // ver que hacemos con el error
        }
        if (exito) {
            
                    for (int x = 0; x < resultados.data.results.count; x++) {
                        NSLog(@"%i - %@",x, resultados.data.results[x].name);
                    }
            
            resultadosDB = resultados;
            [self->_tablaResultados setDataSource:self];
            [self->_tablaResultados reloadData];
            
//            // Muestra info del heroe
//            NSString* imagen = [NSString stringWithFormat:@"%@.%@", resultados.data.results[0].thumbnail.path,  resultados.data.results[0].thumbnail.extension];
//
//            [self->_labelNombre setText:resultados.data.results[0].name];
//            [self->_labelDetalle setText:[resultados.data.results[0].description isEqualToString:@""]  ? NO_HAY_DETALLE : resultados.data.results[0].description];
//            [self->_imagenHeroe sd_setImageWithURL:[NSURL URLWithString:imagen]
//                                  placeholderImage:[UIImage imageNamed:@"sinFoto"]];
//
//            [self guardarHeroe:[resultados.data.results[0].id intValue] nombre:resultados.data.results[0].name imagen:imagen];
//
//            // Activa gestos para ver ima gen
//            UITapGestureRecognizer *tapZoom = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(zoomSobreFoto:)];
//            [tapZoom setNumberOfTapsRequired:1];
//            [self->_imagenHeroe setUserInteractionEnabled:YES];
//            [tapZoom setDelegate:self];
//            [self->_imagenHeroe addGestureRecognizer:tapZoom];
//
//
//            // Procesa caratulas de su carrera Heroica
//
//            // Comics
//            self->_labelCarreraTotalComics.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].comics[0].available];
//            if ([resultados.data.results[0].comics[0].available intValue] > 0) {
//                [self muestraCaratula:resultados.data.results[0].comics[0].items[0].resourceURI imageView:self->_fondoCarreraComics];
//            }
//
//            // Series
//            self->_labelCarreraTotalSeries.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].series[0].available];
//            if ([resultados.data.results[0].series[0].available intValue] > 0) {
//                [self muestraCaratula:resultados.data.results[0].series[0].items[0].resourceURI imageView:self->_fondoCarreraSeries];
//            }
//
//            // Historias
//            self->_labelCarreraTotalHistorias.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].stories[0].available];
//            if ([resultados.data.results[0].stories[0].available intValue] > 0) {
//                [self muestraCaratula:resultados.data.results[0].stories[0].items[0].resourceURI imageView:self->_fondoCarreraHistorias];
//            }
//
//            // Eventos
//            self->_labelCarreraTotalEventos.text = [NSString stringWithFormat:@"%@", resultados.data.results[0].events[0].available];
//            if ([resultados.data.results[0].events[0].available intValue] > 0) {
//                [self muestraCaratula:resultados.data.results[0].events[0].items[0].resourceURI imageView:self->_fondoCarreraEventos];
//            }

       }
        [self->_labelResultados setText:[NSString stringWithFormat:@"ESTAS VIENDO %i HEROES DE %i QUE BUSCASTE COMO %@",(int)resultados.data.results.count,10,self.cadena]];

        [ahiVamos desAnimame];

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (resultadosDB) ? resultadosDB.data.results.count : 0;//_dict.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";

      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
      if (cell == nil) {
          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] ;
      }

    cell.textLabel.text =  resultadosDB.data.results[indexPath.row].name;
    NSLog(@"Celda %@", resultadosDB.data.results[indexPath.row].name);
    
    return cell;
}

@end
