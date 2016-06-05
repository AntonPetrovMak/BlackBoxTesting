//
//  ViewController.h
//  TaylorSeries
//
//  Created by Develop on 29.05.16.
//  Copyright © 2016 antonpetrovmak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *degreesTextField;
@property (weak, nonatomic) IBOutlet UITextField *errorTextField;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
- (IBAction)actionConsider:(id)sender;


@end

