//
//  AZActionSheetButton.h
//  AZActionSheetDemo
//
//  Created by Mohammad Azam on 4/26/14.
//  Copyright (c) 2014 AzamSharp Consulting LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZActionSheetButton : NSObject
{
    
}

-(instancetype) initWithTitle:(NSString *) title isCancel:(BOOL) isCancel; 

@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) BOOL isCancel;

@end
