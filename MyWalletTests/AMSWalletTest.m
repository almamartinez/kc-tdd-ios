//
//  AMSWalletTest.m
//  MyWallet
//
//  Created by Iberfan on 30/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import XCTest;
#import "AMSMoney.h"
#import "AMSBroker.h"
#import "AMSWallet.h"


@interface AMSWalletTest : XCTestCase

@end

@implementation AMSWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//€40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    AMSBroker *broker = [AMSBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AMSWallet *wallet = [[AMSWallet alloc] initWithAmount:40 currency:@"EUR"];
    
    [wallet plus: [AMSMoney dollarWithAmount:20]];
    
    AMSMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [AMSMoney dollarWithAmount:100],@"€40 + $20 = $100 2:1");
}
@end
