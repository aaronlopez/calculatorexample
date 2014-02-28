//
//  CalculatorModel.m
//  Calculadora
//
//  Created by aaron lopez on 20/01/14.
//  Copyright (c) 2014 aaron lopez. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel


- (void) add:(NSInteger) operand{

        self.result=self.result +operand;
}

- (void) reset{
    self.result=0;
}
@end
