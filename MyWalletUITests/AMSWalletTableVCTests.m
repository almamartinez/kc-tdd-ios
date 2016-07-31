//
//  AMSWalletTableVCTests.m
//  MyWallet
//
//  Created by Iberfan on 31/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import XCTest;
#import "AMSWalletTableViewController.h"
#import "AMSWallet.h"

@interface AMSWalletTableVCTests : XCTestCase
@property (nonatomic, strong) AMSWalletTableViewController *walletVC;
@property (nonatomic, strong) AMSWallet *wallet;
@end

@implementation AMSWalletTableVCTests

- (void)setUp {
    [super setUp];
    //Inicialización del tableVC
    self.wallet = [[AMSWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AMSMoney euroWithAmount:1]];
    
    self.walletVC = [[AMSWalletTableViewController alloc] initWithModel:self.wallet];
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.wallet=nil;
    self.walletVC =nil;
    [super tearDown];
}

-(void) testThatTableHasOneSectionMoreThanCurrencies{
    
    UITableView *tb = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:tb];
    
    
    XCTAssertEqual(sections, [self.wallet numberOfCurrencies] +1, @"There must be one section more than the number of currencies.");
    
}

-(void) testThatNumberOfCellsInSectionIsNumberOfMoneysInCurrencyPlusOne{
    
   NSInteger moneysInEuro = [self.wallet countForCurrency:@"EUR"];
    
   XCTAssertEqual(moneysInEuro +1, [self.walletVC.tableView numberOfRowsInSection:[self.walletVC sectionForCurrency:@"EUR"]],@"Number of cells in a section is the number of moneys for a currency plus 1 (the total).");
}

- (void) testThatNumberOfRowsInLastSectionIsOne{
    XCTAssertEqual(1, [self.walletVC.tableView numberOfRowsInSection:[self.wallet numberOfCurrencies] ],@"Number of cells in last section must be 1 (the total).");
}


@end
