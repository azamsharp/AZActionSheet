//
//  AZActionSheet.h
//  AZActionSheetDemo
//
//  Created by Mohammad Azam on 4/26/14.
//  Copyright (c) 2014 AzamSharp Consulting LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AZActionSheetView.h"
#import "AZActionSheetButton.h"



@interface AZActionSheet : NSObject
{

}



+(void) showActionSheetWithTitle:(NSString *) title controller:(UIViewController *) controller cancelButtonTitle:(NSString *) cancelButtonTitle otherButtonTitles:(NSArray *) otherButtonTitles;

@end
