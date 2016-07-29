//
//  EuroTests.m
//  MyWallet
//
//  Created by Iberfan on 26/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//
@import XCTest;
#import "AMSEuro.h"
#import "AMSMoney.h"

@interface AMSEuroTests : XCTestCase

@end

@implementation AMSEuroTests

-(void)testMultiplication{
    AMSEuro *euro = [AMSMoney euroWithAmount: 5];
    
    AMSEuro *ten = [AMSMoney euroWithAmount: 10];
    AMSEuro *total = [euro times:2];
    
    XCTAssertEqualObjects(total,ten, @"5*2 should be 10");
}

-(void) testEquality{
    AMSEuro *five = [AMSMoney euroWithAmount: 5];
    AMSEuro *ten = [AMSMoney euroWithAmount: 10];
    AMSEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
}

-(void) testHash{
    AMSEuro *a = [AMSMoney euroWithAmount:2];
    AMSEuro *b = [AMSMoney euroWithAmount: 2];
    
    XCTAssertEqual(a.hash, b.hash, @"Equal objects must have same hash.");
}

-(void) testAmountStorage{
    AMSEuro *euro = [AMSMoney euroWithAmount:2];
    //Eliminar el warning de amount no declarado porque está oculto ("privado"):
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieve should be the same as the stored");
#pragma clang diagnostic pop
    
}

@end
