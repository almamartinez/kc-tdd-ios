//
//  EuroTests.m
//  MyWallet
//
//  Created by Iberfan on 26/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//
@import XCTest;
#import "AMSEuro.h"

@interface AMSEuroTests : XCTestCase

@end

@implementation AMSEuroTests

-(void)testMultiplication{
    AMSEuro *euro = [[AMSEuro alloc] initWithAmount: 5];
    
    AMSEuro *ten = [[AMSEuro alloc] initWithAmount: 10];
    AMSEuro *total = [euro times:2];
    
    XCTAssertEqualObjects(total,ten, @"5*2 should be 10");
}

-(void) testEquality{
    AMSEuro *five = [[AMSEuro alloc] initWithAmount: 5];
    AMSEuro *ten = [[AMSEuro alloc] initWithAmount: 10];
    AMSEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
}

@end
