//
//  ViewController.m
//  TaylorSeries
//
//  Created by Develop on 29.05.16.
//  Copyright © 2016 antonpetrovmak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Helpers

- (double) factorial:(double) n
{
    if (n == 0) {
        return 1;
    } else {
        return n * [self factorial:n-1];
    }
}

- (double)taylorSeriesCosValue:(int) value error:(double) error {
    double y = 0;
    for (int i = 0; i < 100; i ++) {
        //NSLog(@"%f", pow(value*M_PI/180, 2*i));
        double val = (pow(-1, i)*pow(value*M_PI/180, 2*i)) / [self factorial:2*i];
        //NSLog(@"val = %f, |%f| < %f", val, fabs(val-((int)val)), error);
        if(fabs(val-((int)val)) < error && fabs(val-((int)val)) != 0){
            //NSLog(@"cos(%d,%f)=%f", value,error, y);
            return y;
        } else {
            y+= val;
        }
    }
    
    return 0.f;
}

#pragma mark - Actions

- (IBAction)actionConsider:(id)sender {
    if(self.degreesTextField.text.length == 0 || self.errorTextField.text.length == 0) {
        self.answerLabel.text = @"Заполните все поля";
    } else if([self.degreesTextField.text isEqualToString:@"2"]) {
        self.answerLabel.text = @"X не может принимать значения {0,2}";
    } else if([self.errorTextField.text intValue] == 0) {
        self.answerLabel.text = @"error не может быть равен нулю";
    } else {
        int x = [self.degreesTextField.text intValue];
        double error = [[NSString stringWithFormat:@"0.%@", self.errorTextField.text] doubleValue];
        double y = [self taylorSeriesCosValue:x - 2 error:error]/(x *[self taylorSeriesCosValue:x error:error]);
        if(y == INFINITY || y == NAN) {
            self.answerLabel.text = @"Некорректный ввод";
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"y=cos(x-2)/(x*cos(x))=%.8f", y];
        }
       
        //NSLog(@"y(%d,%f)=%f", x, error, y);
    }
   
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if(textField.tag == 0) {
        NSString *text = [NSString stringWithFormat:@"%@%@",textField.text, string];
        if([text intValue] <=90 && [text intValue] >= 1) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return YES;
    }
   

}

@end
