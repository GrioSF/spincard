//
//  ViewController.h
//  spincard
//
//  Created by Douglas Kadlecek on 7/14/12.
//  Copyright (c) 2012 Grio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *cardBack;
@property (weak, nonatomic) IBOutlet UIImageView *cardFront;
@property (weak, nonatomic) IBOutlet UIView *card;
- (IBAction)spinButtonTouched:(id)sender;

@end
