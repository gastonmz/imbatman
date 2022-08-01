//
//  DickGrayson.h
//  Im Batman
//
//  Created by Gaston Mz on 31/07/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DickGrayson : UIViewController <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *fondo;
@property (weak, nonatomic) IBOutlet UIImageView *nubeInferior;
@property (weak, nonatomic) IBOutlet UIImageView *imagenVolver;
@property (weak, nonatomic) IBOutlet UILabel *labelVolver;
@property (weak, nonatomic) IBOutlet UIView *vistaPreferencias;
@property (weak, nonatomic) IBOutlet UIImageView *imagenBurbuja;
@property (weak, nonatomic) IBOutlet UITableView *tablaResultados;
@property (weak, nonatomic) IBOutlet UIImageView *imagenResultados;
@property (weak, nonatomic) IBOutlet UILabel *labelResultados;

@property (weak, nonatomic) IBOutlet UIImageView *prefsFondo;
@property (weak, nonatomic) IBOutlet UILabel *prefsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *prefsImagenBuscar;
@property (weak, nonatomic) IBOutlet UILabel *prefsLabelBuscar;
@property (weak, nonatomic) IBOutlet UIImageView *prefsImagenFiltrar;
@property (weak, nonatomic) IBOutlet UILabel *prefsLabelFiltrar;
@property (weak, nonatomic) IBOutlet UIImageView *prefsImagenMostrar;
@property (weak, nonatomic) IBOutlet UILabel *prefsLabelMostrar;
@property (weak, nonatomic) IBOutlet UILabel *prefsCantidad;


@end

NS_ASSUME_NONNULL_END
