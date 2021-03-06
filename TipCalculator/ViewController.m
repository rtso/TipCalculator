//
//  ViewController.m
//  TipCalculator
//
//  Created by Renee on 12/29/15.
//  Copyright © 2015 Renee Tso. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *checkTotal;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *peopleLabel;
@property (weak, nonatomic) IBOutlet UIStepper *peopleStepper;
@property (weak, nonatomic) IBOutlet UILabel *totalPerPersonLabel;
@property NSInteger percentTip;
@property double totalAmount;

@end

@implementation ViewController
- (IBAction)textFieldChanged:(UITextField *)sender {
    float check = [self.checkTotal.text floatValue];
    float tip = check * ((float)self.percentTip / 100.0);
    self.totalAmount = tip + check;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalAmount];
    self.totalPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", (self.totalAmount / self.peopleStepper.value)];
}
- (IBAction)tipAmountChanged:(UISegmentedControl *)sender {
    if (self.tipAmount.selectedSegmentIndex == 0) {
        self.percentTip = 10;
    } else if (self.tipAmount.selectedSegmentIndex == 1) {
        self.percentTip = 15;
    } else {
        self.percentTip = 20;
    }
    float check = [self.checkTotal.text floatValue];
    float tip = check * ((float)self.percentTip / 100.0);
    self.totalAmount = tip + check;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", self.totalAmount];
    self.totalPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", (self.totalAmount / self.peopleStepper.value)];
}
- (IBAction)peopleStepperChanged:(UIStepper *)sender {
    self.peopleLabel.text = [NSString stringWithFormat:@"%.f", self.peopleStepper.value];
    self.totalPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f", (self.totalAmount / self.peopleStepper.value)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.percentTip = 15;
    self.peopleLabel.text = [NSString stringWithFormat:@"%.f", self.peopleStepper.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
