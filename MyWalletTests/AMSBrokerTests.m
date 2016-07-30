//
//  AMSBrokerTests.m
//  MyWallet
//
//  Created by Iberfan on 29/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import XCTest;
#import "AMSMoney.h"
#import "AMSBroker.h"

@interface AMSBrokerTests : XCTestCase
@property (nonatomic,strong) AMSBroker *emptyBroker;
@property (nonatomic,strong) AMSMoney *oneDollar;
@end

@implementation AMSBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [AMSBroker new];
    self.oneDollar = [AMSMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testSimpleReduction{
    
    AMSMoney *sum = [[AMSMoney dollarWithAmount:5] plus:[AMSMoney dollarWithAmount:5]];
    
    AMSMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

-(void) testReduction{
    [self.emptyBroker addRate: 2 fromCurrency: @"EUR" toCurrency: @"USD"];
    
    
    AMSMoney *dollars = [AMSMoney dollarWithAmount:10];
    AMSMoney *euro = [AMSMoney euroWithAmount:5];
    
    AMSMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];

    XCTAssertEqualObjects(converted, euro, @"$10 == €5 2:1");
}


-(void) testThatNoRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}

-(void) testThatNilConversionDoesNotChangeMoney{
    
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should have not effect");
}












@end
