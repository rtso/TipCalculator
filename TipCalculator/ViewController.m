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
@property NSInteger percentTip;

@end

@implementation ViewController
- (IBAction)textFieldChanged:(UITextField *)sender {
    float check = [self.checkTotal.text floatValue];
    float tip = check * ((float)self.percentTip / 100.0);
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tip];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.percentTip = 15;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
