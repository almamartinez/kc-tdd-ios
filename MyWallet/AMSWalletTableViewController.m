//
//  AMSWalletTableViewController.m
//  MyWallet
//
//  Created by Iberfan on 31/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSWalletTableViewController.h"
#import "AMSWallet.h"
#import "AMSMoney.h"

@interface AMSWalletTableViewController ()
@property (nonatomic, strong) AMSWallet *model;
@end

@implementation AMSWalletTableViewController

-(id)initWithModel:(AMSWallet *)wallet{
    if(self = [super initWithStyle:UITableViewStylePlain]){
        _model=wallet;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"My Wallet";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Métodos Auxiliares
-(NSInteger) sectionForCurrency:(NSString *)currency{
    return [self.model.currencies indexOfObject:currency];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.model numberOfCurrencies] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section >= self.model.numberOfCurrencies){
        return 1;
    }
    return [self.model countForCurrency:[self.model.currencies objectAtIndex:section]] + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section >= self.model.numberOfCurrencies){
        return @"TOTAL WALLET ";
    }
    return [self.model.currencies objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MoneyCell";
    static NSString *TotalCellIdentifier = @"TotalCell";
    static NSString *LastCell = @"LastTotalCell";
    UITableViewCell *cell;
    //Currency:
    if(indexPath.section < self.model.numberOfCurrencies){
        NSString *currency = [self.model.currencies objectAtIndex:indexPath.section];
        
        if (indexPath.row >= [self.model countForCurrency:currency]){
            //Es una celda total
            cell = [self emptyCellForTable:tableView initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TotalCellIdentifier];
            cell.textLabel.text = @"Total";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu %@",(unsigned long)[self.model amountForCurrency:currency],currency];
            
        }else{
            //Es una celda money
            cell = [self emptyCellForTable:tableView initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            cell.textLabel.text = [NSString stringWithFormat:@"%@ ",[self.model moneyAtPosition:indexPath.row ForCurrency:currency].amount];
            cell.detailTextLabel.text = currency;
        }
    }else{
        //Es la celda total
        cell = [self emptyCellForTable:tableView initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:LastCell];
        cell.textLabel.text=@"Total Wallet = ";
        AMSBroker *broker = [AMSBroker new];
        [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
        AMSMoney *reduced = [broker reduce:self.model toCurrency:@"EUR"];

        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",reduced.amount,@"EUR"];
    }
    
    return cell;
}

- (UITableViewCell *) emptyCellForTable:(UITableView *)tableView initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        // La creamos de cero
        cell = [[UITableViewCell alloc] initWithStyle:style
                                      reuseIdentifier:identifier];
    }
    return  cell;
 
}
@end
