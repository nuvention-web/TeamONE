//
//  ConfigurationViewController.m
//  BabyNinja
//
//  Created by Sneha on 2/28/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "ConfigurationViewController.h"
#import "ConfigurationTableViewCell.h"
#import "MilkSettingsViewController.h"
#import "DiaperSettingsViewController.h"


@interface ConfigurationViewController ()
@property(nonatomic, strong) NSArray *actions;
@property(nonatomic, strong)NSDictionary *configurationSettingsRequired;
@end

@implementation ConfigurationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.actions = [[NSArray alloc] initWithObjects:@"Feed",@"Diaper", @"Milk",@"Sleep", nil];
    
    self.configurationSettingsRequired = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithBool:YES], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], nil] forKeys:self.actions];
    [self.tableView registerClass:[ConfigurationTableViewCell class] forCellReuseIdentifier:@"configurationCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ConfigurationTableViewCell" bundle:nil] forCellReuseIdentifier:@"configurationCell"];
    self.tableView.scrollEnabled = NO;
//    [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.actions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ConfigurationTableViewCell *cell = (ConfigurationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"configurationCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.configurationNameLabel.text = [self.actions objectAtIndex:indexPath.row];
    cell.furtherConfigurationRequired = [[self.configurationSettingsRequired valueForKey:[self.actions objectAtIndex:indexPath.row]] boolValue];
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"Apple Watch";
    } else
        return @"iPhone";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ConfigurationTableViewCell *cell = (ConfigurationTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    if([cell.configurationNameLabel.text isEqualToString:@"Milk"]){
        MilkSettingsViewController *controller = [[MilkSettingsViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if([cell.configurationNameLabel.text isEqualToString:@"Diaper"]){
        DiaperSettingsViewController *controller = [[DiaperSettingsViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
        ConfigurationTableViewCell *cell = (ConfigurationTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    if([cell.configurationNameLabel.text isEqualToString:@"Milk"]){
        MilkSettingsViewController *controller = [[MilkSettingsViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    } else if([cell.configurationNameLabel.text isEqualToString:@"Diaper"]){
        DiaperSettingsViewController *controller = [[DiaperSettingsViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }
        
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
