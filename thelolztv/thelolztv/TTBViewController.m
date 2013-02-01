//
//  TTBViewController.m
//  thelolztv
//
//  Created by Jabari Bell on 1/31/13.
//  Copyright (c) 2013 Jabari Bell. All rights reserved.
//

#import "TTBViewController.h"

@interface TTBViewController ()
@property (strong, nonatomic) IBOutlet UITextField *searchField;
@end

@implementation TTBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.searchField addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldFinished:(id)sender
{
    NSLog(@"omg");
}

@end
