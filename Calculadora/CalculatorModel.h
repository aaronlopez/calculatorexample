//
//  CalculatorModel.h
//  Calculadora
//
//  Created by aaron lopez on 20/01/14.
//  Copyright (c) 2014 aaron lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject
@property NSInteger result;

/**
 Suma el número almacenado con el pasado por parametro
 
 @param operand
 numero que será sumado con el actual
 */
- (void) add:(int) operand;
/**
 Resetea el resultado, resultado ahora es igual a 0
 */

- (void) reset;

@end
