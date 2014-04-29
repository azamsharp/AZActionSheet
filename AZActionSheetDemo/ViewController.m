//
//  ViewController.m
//  AZActionSheetDemo
//
//  Created by Mohammad Azam on 4/26/14.
//  Copyright (c) 2014 AzamSharp Consulting LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<AZActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{   
    [super viewDidLoad];
    
    [self showAZActionSheet];
}

-(void) showAZActionSheet
{
    [AZActionSheet showActionSheetWithTitle:@"Actions" controller:self cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Water",@"Fertilize",@"Treat"]];
}

-(void) azActionSheetDidDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Selected Index: %d",buttonIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction) show:(id) sender
{
    [self showAZActionSheet];
}

@end
