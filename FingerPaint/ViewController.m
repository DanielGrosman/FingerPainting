//
//  ViewController.m
//  FingerPaint
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawingView *drawingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clearButton:(id)sender {
    [self.drawingView clear];
}



@end
