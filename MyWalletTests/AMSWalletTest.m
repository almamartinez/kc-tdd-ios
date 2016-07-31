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
@property (nonatomic,strong) AMSWallet *wallet;

@end

@implementation AMSWalletTest

- (void)setUp {
    [super setUp];
    self.wallet = [[AMSWallet alloc] initWithAmount:40 currency:@"EUR"];
    [self.wallet plus: [AMSMoney dollarWithAmount:20]];
    [self.wallet plus:[AMSMoney euroWithAmount:20]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//€40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    AMSBroker *broker = [AMSBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    AMSMoney *reduced = [broker reduce:self.wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [AMSMoney dollarWithAmount:140],@"€60 + $20 = $140 2:1");
}

-(void) testNumberOfCurrencies{
    
    XCTAssertEqual(2, [self.wallet numberOfCurrencies],@"Number of currencies in wallet must be 2");
}

-(void) testTotalForCurrency{
    
    XCTAssertEqual(60, [self.wallet amountForCurrency:@"EUR"], @"There are 60€ in the wallet.");
}

-(void) testNumberOfMoneysPerCurrency{

    XCTAssertEqual(2, [self.wallet countForCurrency:@"EUR"], @"There are 2 Moneys for EUR in the wallet.");
}

-(void) testOrderOfCurrencies{ //Nos aseguramos de que las currencies siempre se devuelven en orden alfabético.
    NSArray *currencies= [self.wallet currencies];
    
    XCTAssertEqualObjects(@"EUR", [currencies objectAtIndex:0],@"The first currency must be EUR if ordered alphabetically.");
    XCTAssertEqualObjects(@"USD", [currencies objectAtIndex:1],@"The second currency must be USD if ordered alphabetically.");
}
-(void) testMoneyAtFirstPositionForEUR{
    XCTAssertEqualObjects([AMSMoney euroWithAmount:40], [self.wallet moneyAtPosition:0 ForCurrency:@"EUR"],@"The first inserted EUR was 40€");
}

@end
