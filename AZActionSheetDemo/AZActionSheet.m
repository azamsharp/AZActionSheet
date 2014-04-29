//
//  AZActionSheet.m
//  AZActionSheetDemo
//
//  Created by Mohammad Azam on 4/26/14.
//  Copyright (c) 2014 AzamSharp Consulting LLC. All rights reserved.
//

#import "AZActionSheet.h"



@implementation AZActionSheet

+(void) showActionSheetWithTitle:(NSString *)title controller:(UIViewController *)controller cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles
{
    NSMutableArray *actionSheetButtons = [NSMutableArray array];
    
    for(NSString *buttonTitle in otherButtonTitles)
    {
        AZActionSheetButton *azActionSheetButton = [[AZActionSheetButton alloc] initWithTitle:buttonTitle isCancel:NO];
        
        [actionSheetButtons addObject:azActionSheetButton];
    }
    
    if(cancelButtonTitle != nil)
    {
        AZActionSheetButton *cancelButton = [[AZActionSheetButton alloc] initWithTitle:cancelButtonTitle isCancel:YES];
        
        [actionSheetButtons addObject:cancelButton];
    }
    
    [actionSheetButtons addObject:@""];
    
    AZActionSheetView *azActionSheetView = [[AZActionSheetView alloc] initWithTitle:@"Actions" actionSheetButtons:actionSheetButtons referenceView:controller.view];
    azActionSheetView.delegate = controller;
    
    [controller.view addSubview:azActionSheetView];
    
    [azActionSheetView applyDynamics];
}


@end
