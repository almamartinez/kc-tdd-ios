//
//  AMSDollarTests.m
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//
@import XCTest;
#import "AMSDollar.h"
#import "AMSMoney.h"

@interface AMSDollarTests : XCTestCase


@end

@implementation AMSDollarTests

- (void)testMultiplication{
    
    AMSDollar *five = [AMSMoney dollarWithAmount: 5];
    AMSDollar *total = [five times: 2];
    AMSDollar *ten = [AMSMoney dollarWithAmount:  10];

    XCTAssertEqualObjects(ten,total, @"$5 * 2 = $10");
}
-(void) testEquality{
    AMSDollar *five = [AMSMoney dollarWithAmount:  5];
    AMSDollar *ten = [AMSMoney dollarWithAmount:  10];
    AMSDollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}


-(void) testHash{
    AMSDollar *a = [AMSMoney dollarWithAmount:  2];
    AMSDollar *b = [AMSMoney dollarWithAmount:  2];
    
    XCTAssertEqual(a.hash, b.hash, @"Equal objects must have same hash.");
}

-(void) testAmountStorage{
    AMSDollar *dollar = [AMSMoney dollarWithAmount:2];
    //Eliminar el warning de amount no declarado porque está oculto ("privado"):
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] integerValue], @"The value retrieve should be the same as the stored");
#pragma clang diagnostic pop
    
}
@end
