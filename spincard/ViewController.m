//
//  ViewController.m
//  spinview
//
//  Created by Douglas Kadlecek on 7/14/12.
//  Copyright (c) 2012 Grio. All rights reserved.
//

#import "ViewController.h"

#define SPIN_DURATION 1.0f

@implementation ViewController
@synthesize card;
@synthesize cardBack;
@synthesize cardFront;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCardFront:nil];
    [self setCardBack:nil];
    [self setCard:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (IBAction)spinButtonTouched:(id)sender
{
    [self spinCard: 5];
}

- (void) spinCard: (int) rotations
{
    if (rotations == 0) return;
    
    [UIView transitionWithView: card
                      duration: SPIN_DURATION / 2
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    animations: ^{
                        cardFront.hidden = YES;
                        cardBack.hidden = NO;
                    }
                    completion: ^(BOOL finished) {
                        
                        [UIView transitionWithView: card
                                          duration:  SPIN_DURATION / 2
                                           options: UIViewAnimationOptionTransitionFlipFromLeft
                                        animations: ^{
                                            cardBack.hidden = YES;
                                            cardFront.hidden = NO;
                                        }
                                        completion: ^(BOOL finished) {
                                            [self spinCard: rotations - 1];
                                        }];
                    }];
}

@end

