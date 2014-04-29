//
//  AZActionSheetButton.m
//  AZActionSheetDemo
//
//  Created by Mohammad Azam on 4/26/14.
//  Copyright (c) 2014 AzamSharp Consulting LLC. All rights reserved.
//

#import "AZActionSheetButton.h"

@implementation AZActionSheetButton

-(instancetype) initWithTitle:(NSString *)title isCancel:(BOOL)isCancel
{
    self = [super init];
    self.title = title;
    self.isCancel = isCancel;
    return self;
}

@end
