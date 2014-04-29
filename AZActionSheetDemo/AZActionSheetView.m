//
//  AZActionSheetView.m
//  AZActionSheetDemo
//
//  Created by Mohammad Azam on 4/26/14.
//  Copyright (c) 2014 AzamSharp Consulting LLC. All rights reserved.
//

#import "AZActionSheetView.h"

static int const AZ_ACTION_SHEET_HEIGHT = 44;
static NSString *const CANCEL_BUTTON_COLOR = @"D75353";
static NSString *const TABLE_BACKGROUND_COLOR = @"DCDDE5";
static int const ROW_HEIGHT_TITLE = 44;


@implementation AZActionSheetView

-(instancetype) initWithTitle:(NSString *)title actionSheetButtons:(NSArray *)actionSheetButtons referenceView:(UIView *)referenceView
{
    self = [super init];
    _actionSheetButtons = actionSheetButtons;
    _referenceView = referenceView;
    _title = title; 
    
    [self setup];
    return self;
}

-(void) setup
{
    screenBounds = [[UIScreen mainScreen] bounds];
    
    self.frame = CGRectMake(0, screenBounds.size.height + AZ_ACTION_SHEET_HEIGHT * [_actionSheetButtons count], screenBounds.size.width - 20, AZ_ACTION_SHEET_HEIGHT * [_actionSheetButtons count]);
    
    _tableCellIndex = 0;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, -10, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = [UIColor colorFromHexString:TABLE_BACKGROUND_COLOR];
    _tableView.layer.cornerRadius = 6.0;
    _tableView.layer.masksToBounds = YES;
    
    [self addSubview:_tableView];
    
    [_tableView reloadData];
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
    headerView.backgroundColor = [UIColor grayColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:headerView.frame];
    titleLabel.text = _title;
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    
    [headerView addSubview:titleLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ROW_HEIGHT_TITLE;
}

-(void) applyDynamics
{
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:_referenceView];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self]];
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self]];
    _itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self]];

    _itemBehavior.elasticity = 0.25;
    
    [_gravity setGravityDirection:CGVectorMake(0, -1.5)];
    
    [_collision addBoundaryWithIdentifier:@"AZActionSheetBoundary" fromPoint:CGPointMake(0, screenBounds.size.height - self.bounds.size.height) toPoint:CGPointMake(_referenceView.bounds.size.width, screenBounds.size.height - self.bounds.size.height)];
    
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    [_animator addBehavior:_itemBehavior];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [_actionSheetButtons count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_animator removeBehavior:_gravity];
    
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self]];
    [_gravity setGravityDirection:CGVectorMake(0, 3)];
    
    [_animator addBehavior:_gravity];
    
    if(self.delegate) {
        [self.delegate azActionSheetDidDismissWithButtonIndex:[indexPath row]];
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    AZActionSheetButton *actionSheetButton = [_actionSheetButtons objectAtIndex:_tableCellIndex];
    cell.textLabel.text = actionSheetButton.title;
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];

    if(!actionSheetButton.isCancel)
    {
        cell.backgroundColor = [UIColor clearColor];
    }
    else
    {
        cell.backgroundColor = [UIColor colorFromHexString:CANCEL_BUTTON_COLOR];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    _tableCellIndex++;
    
    return cell;
}

@end
