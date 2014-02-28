//
//  CalculadoraTests.m
//  CalculadoraTests
//
//  Created by aaron lopez on 20/01/14.
//  Copyright (c) 2014 aaron lopez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalculatorViewController.h"

@interface CalculadoraTests : XCTestCase
@property CalculatorViewController *calculator;
@property CalculatorViewController *storeController;
@property  UIStoryboard *storyboard ;
@end

@implementation CalculadoraTests

- (void)setUp
{
    [super setUp];
     self.calculator=[[CalculatorViewController alloc] init];
    
   // self.storeController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"calculator"];
    
    self.storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.storeController = [self.storyboard instantiateViewControllerWithIdentifier:@"calculator"];
    [self.storeController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
[self.storeController viewDidLoad];
    [self.storeController viewWillAppear:NO];
     [self.storeController viewDidAppear:NO];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [self.calculator clearPressed:nil];
}



//SIMPLE TEST 1 1+2=3
-(void)testSumaSimple{
    UIButton * button=[[UIButton alloc] init];
    [button setTitle:@"1" forState:UIControlStateNormal];
    
    
    [self.calculator numberPressed:button];
    [button setTitle:@"+" forState:UIControlStateNormal];
    
    [self.calculator operatorPressed:button];
    [button setTitle:@"3" forState:UIControlStateNormal];
    
    [self.calculator numberPressed:button];
    
    
    [self.calculator operatorPressed:self.calculator.equal];
  
    XCTAssertEqual(4,self.calculator.model.result);
}


-(void)testRestaSimple{
    UIButton * button=[[UIButton alloc] init];
    [button setTitle:@"1" forState:UIControlStateNormal];
    
    [self.calculator numberPressed:button];
    [button setTitle:@"-" forState:UIControlStateNormal];
    
    [self.calculator operatorPressed:button];
    [button setTitle:@"3" forState:UIControlStateNormal];
    
    [self.calculator numberPressed:button];
    
    
    [self.calculator operatorPressed:self.calculator.equal];
    
    XCTAssertEqual(-2,self.calculator.model.result);
}

@end
