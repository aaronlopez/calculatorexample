//
//  ViewController.h
//  Calculadora
//
//  Created by aaron lopez on 20/01/14.
//  Copyright (c) 2014 aaron lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorModel.h"
/**
 @class CalculatorViewController
 Presentador que almacena el numero actual y la operación temporalmente
 @property number valor introducido
  @property operador valor introducido
 */
@interface CalculatorViewController : UIViewController

@property NSString* number;
@property NSString* saveOperand;

@property CalculatorModel * model;

@property (weak, nonatomic) IBOutlet UIButton *equal;
@property (weak, nonatomic) IBOutlet UILabel *display;

/**
 Imprime el texto pasado en el display (uilabel)
 @param text
 El texto a imprimir.
 */
-(void) display:(NSString* )text;


/**
 Añade el texto del boton a los números actuales del display,
 si el display es 0 lo sustituye
 @param sender
 boton con el numero
 */

- (IBAction)numberPressed:(UIButton *)sender;
/**
 Reseta el display, los valores guardados y el modelo
 @param sender 
 NO se usa
 */

- (IBAction)clearPressed:(id)sender ;

/**
 Operación que se debe realizar,

 @param sender
 Boton cuyo label tiene el boton
 */
- (IBAction)operatorPressed:(UIButton *)sender ;
@end
