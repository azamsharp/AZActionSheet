//
//  AZActionSheetView.h
//  AZActionSheetDemo
//
//  Created by Mohammad Azam on 4/26/14.
//  Copyright (c) 2014 AzamSharp Consulting LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Additions.h"
#import "AZActionSheetButton.h"
#import "AZActionSheet.h"

@protocol AZActionSheetDelegate

-(void) azActionSheetDidDismissWithButtonIndex:(NSInteger) buttonIndex;

@end

@interface AZActionSheetView : UIView<UITableViewDataSource, UITableViewDelegate>
{
    NSString *_title; 
    
    UITableView *_tableView;
    NSArray *_actionSheetButtons;
    
    int _tableCellIndex;
    UIView *_referenceView;
    CGRect screenBounds;
    
    UIDynamicAnimator *_animator;
    UIGravityBehavior *_gravity;
    UICollisionBehavior *_collision;
    UIDynamicItemBehavior *_itemBehavior;
    UIPushBehavior *_push;
    UIAttachmentBehavior *_attachment; 
}

@property (nonatomic,weak) id<AZActionSheetDelegate> delegate;

-(instancetype) initWithTitle:(NSString *) title  actionSheetButtons:(NSArray *) actionSheetButtons referenceView:(UIView *) referenceView;
-(void) applyDynamics;

@end
