//
//  LeftSideController.m
//  BabyNinja
//
//  Created by Sneha on 2/3/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "LeftSideController.h"
#import "MainViewController.h"
#import "BabyProfileCell.h"
#import "CareTakersListCell.h"

static NSString * const kICSColorsViewControllerCellReuseId = @"kICSColorsViewControllerCellReuseId";



@interface LeftSideController ()

@property(nonatomic, strong) NSArray *colors;
@property(nonatomic, assign) NSInteger previousRow;
@property(nonatomic, strong) NSArray *actions;

@end



@implementation LeftSideController

- (id)initWithColors:(NSArray *)colors
{
    NSParameterAssert(colors);
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _colors = colors;
    }
    return self;
}

#pragma mark - Managing the view

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.actions = [[NSArray alloc] initWithObjects:@"Reports",@"Settings", @"Logout", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kICSColorsViewControllerCellReuseId];
    [self.tableView registerClass:[BabyProfileCell class] forCellReuseIdentifier:@"babyCell"];
    [self.tableView registerClass:[CareTakersListCell class] forCellReuseIdentifier:@"careTakerCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BabyProfileCell" bundle:nil] forCellReuseIdentifier:@"babyCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CareTakersListCell" bundle:nil] forCellReuseIdentifier:@"careTakerCell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

//    self.tableView.tableFooterView = myCustomFooterView
}

#pragma mark - Configuring the view’s layout behavior

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0){
        return 2;
    }else {
        NSParameterAssert(self.colors);
        return self.actions.count;
        //        return self.colors.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier;
    if (indexPath.section==0) {
        if (indexPath.row==0)
            cellIdentifier = @"babyCell";
        else
            cellIdentifier = @"careTakerCell";
    } else {
        cellIdentifier = kICSColorsViewControllerCellReuseId;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    if(indexPath.section==0){
        if(indexPath.row==0){
            BabyProfileCell *profileCell = (BabyProfileCell *)cell;
            [profileCell configureCell];
            
            return profileCell;
        } else {
            CareTakersListCell *profileCell = (CareTakersListCell *)cell;
            [profileCell configureCell];
            return profileCell;
        }
    } else {
        NSParameterAssert(self.colors);
        cell.textLabel.text = [self.actions objectAtIndex:indexPath.row];
        //    cell.textLabel.text = [NSString stringWithFormat:@"Color %ld", (long)indexPath.row];
        cell.textLabel.textColor = [UIColor whiteColor];
        
        cell.backgroundColor = self.colors[indexPath.row];
        
        return cell;
    }
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.row == self.previousRow) {
    //        // Close the drawer without no further actions on the center view controller
    //        [self.drawer close];
    //    }
    //    else {
    //        // Reload the current center view controller and update its background color
    //        typeof(self) __weak weakSelf = self;
    //        [self.drawer reloadCenterViewControllerUsingBlock:^(){
    //            NSParameterAssert(weakSelf.colors);
    //            weakSelf.drawer.centerViewController.view.backgroundColor = weakSelf.colors[indexPath.row];
    //        }];
    //
    //        //        // Replace the current center view controller with a new one
    //        //        ICSPlainColorViewController *center = [[ICSPlainColorViewController alloc] init];
    //        //        center.view.backgroundColor = [UIColor redColor];
    //        //        [self.drawer replaceCenterViewControllerWithViewController:center];
    //    }
    //    self.previousRow = indexPath.row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 && indexPath.row ==0)
        return 160;
    else if (indexPath.section==0 && indexPath.row ==1)
        return 90;
    else
        return 44;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

@end
