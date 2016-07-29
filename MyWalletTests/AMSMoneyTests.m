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
-(void) testCurrency{
    
    XCTAssertEqualObjects(@"EUR", [[AMSMoney euroWithAmount:1] currency], @"The currency of Euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[AMSMoney dollarWithAmount:1] currency], @"The currency of Dollars should be USD");
}

@end
