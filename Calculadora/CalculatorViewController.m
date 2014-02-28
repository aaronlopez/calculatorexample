//
//  ViewController.m
//  Calculadora
//
//  Created by aaron lopez on 20/01/14.
//  Copyright (c) 2014 aaron lopez. All rights reserved.
//

#import "CalculatorViewController.h"
@interface CalculatorViewController ()
@end

@implementation CalculatorViewController

-(CalculatorViewController*) init{
    self=[super init];
    if(self){
        self.number=@"0";
        self.saveOperand=@"";
        self.model=[[CalculatorModel alloc] init];
    }
    return self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.number=@"0";
    self.saveOperand=@"";
    self.model=[[CalculatorModel alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark auxiliar

-(Boolean)isPresenterNumberZero{
    if([self.number isEqualToString:@"0"]){
        return YES;
    }
    return NO;
}


#pragma  mark presenter

-(void) display:(NSString* )text{
    self.display.text=text;
   
}
- (void) displayModelResult {
    NSInteger current_value = [self.model result] ;
    [self display:[NSString stringWithFormat:@"%i",current_value]];
}




-(void)reset_PresenterNumber{
    self.number=@"0";

}
-(void)reset_savedOperand{
    self.saveOperand=@"";
    
}

#pragma mark view
- (void) displayPresenterNumber {
    self.display.text=self.number;
 }


- (IBAction)numberPressed:(UIButton *)sender {
    
    NSInteger MaxDigits = [[NSString stringWithFormat:@"%li",NSIntegerMax ] length];
    if ([self.number length] < MaxDigits) {
        if ([self isPresenterNumberZero]) {
            self.number=sender.titleLabel.text;
        } else {
            self.number= [self.number stringByAppendingString:sender.titleLabel.text];
        }
    }
    [self displayPresenterNumber];

}

- (IBAction)clearPressed:(id)sender {
    [self reset_PresenterNumber ];
    [self reset_savedOperand];
    [self.model reset];
    [self displayPresenterNumber];

}


- (IBAction)operatorPressed:(UIButton *)sender {
   
    NSInteger n;
    
    n=[self.number integerValue];
    
    if ( [self.saveOperand isEqualToString:@""] &&
        self.model.result  == 0) {
        self.model.result=n;
        
    } else {
        [self.model add:n];
    }
    
    
    [self displayModelResult];
    [self reset_PresenterNumber];
    [self setSaveOperand:sender.titleLabel.text];
    
}


@end
