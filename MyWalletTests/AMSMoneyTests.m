//
//  AMSMoneyTests.m
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AMSMoney.h"

@interface AMSMoneyTests : XCTestCase

@end

@implementation AMSMoneyTests

/*-(void) testThatTimesRaisesException{
    
    AMSMoney *money = [[AMSMoney alloc] initWithAmount:1];
    
    XCTAssertThrows([money times:2], @"Should raise an exception");

}*/
-(void)testMultiplication{
    AMSMoney *euro = [AMSMoney euroWithAmount: 5];
    
    AMSMoney *ten = [AMSMoney euroWithAmount: 10];
    AMSMoney *total = [euro times:2];
    
    XCTAssertEqualObjects(total,ten, @"€5*2 should be €10");
    
    XCTAssertEqualObjects([AMSMoney dollarWithAmount:10], [[AMSMoney dollarWithAmount:5] times:2], @"$5*2 should be $10");
    
}

-(void) testEquality{
    AMSMoney *five = [AMSMoney euroWithAmount: 5];
    AMSMoney *ten = [AMSMoney euroWithAmount: 10];
    AMSMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    XCTAssertEqualObjects([AMSMoney dollarWithAmount:10], [[AMSMoney dollarWithAmount:5] times:2], @"Equivalent objects should be equal!");
    
}

-(void) testDifferentCurrencies{
    AMSMoney *euro = [AMSMoney euroWithAmount:1];
    AMSMoney *dollar = [AMSMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equal!");
}

-(void) testHash{
    AMSMoney *a = [AMSMoney euroWithAmount:2];
    AMSMoney *b = [AMSMoney euroWithAmount: 2];
    
    XCTAssertEqual(a.hash, b.hash, @"Equal objects must have same hash.");
    XCTAssertEqual([[AMSMoney dollarWithAmount:10] hash], [[AMSMoney dollarWithAmount:10] hash], @"Equal objects must have same hash!");
}

-(void) testAmountStorage{
    AMSMoney *euro = [AMSMoney euroWithAmount:2];
    //Eliminar el warning de amount no declarado porque está oculto ("privado"):
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieve should be the same as the stored");
    
    XCTAssertEqual(4, [[[AMSMoney dollarWithAmount:4] performSelector:@selector(amount)] integerValue], @"The value retrieve should be the same as the stored");
#pragma clang diagnostic pop
    
}

-(void) testCurrency{
    
    XCTAssertEqualObjects(@"EUR", [[AMSMoney euroWithAmount:1] currency], @"The currency of Euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[AMSMoney dollarWithAmount:1] currency], @"The currency of Dollars should be USD");
}

-(void) testSimpleAddition{
    
    XCTAssertEqualObjects([[AMSMoney dollarWithAmount:5] plus: [AMSMoney dollarWithAmount:5]] ,
                          [AMSMoney dollarWithAmount:10],
                          @"$5 + $5 = $10");
}


-(void)testHashIsAmount{
    AMSMoney *one = [AMSMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1, @"Tha Hash must be the same as the amount");
}

-(void) testDescription{
    AMSMoney *one = [AMSMoney dollarWithAmount:1];
    NSString *descrip=@"<AMSMoney: 1 USD>";
    
    XCTAssertEqualObjects(descrip, one.description, @"Description must match template");
}


@end
