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

@end

@implementation AMSBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testSimpleReduction{
    AMSBroker *broker = [[AMSBroker alloc] init];
    AMSMoney *sum = [[AMSMoney dollarWithAmount:5] plus:[AMSMoney dollarWithAmount:5]];
    
    AMSMoney *reduced = [broker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

@end
