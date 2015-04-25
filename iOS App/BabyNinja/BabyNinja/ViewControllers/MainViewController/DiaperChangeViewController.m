//
//  DiaperChangeViewController.m
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "DiaperChangeViewController.h"
#import "PoopTypeSelectionViewController.h"
#import "WYPopoverController.h"

@interface DiaperChangeViewController ()<UIPopoverPresentationControllerDelegate, WYPopoverControllerDelegate>{
    WYPopoverController * popController;
}
@property (weak, nonatomic) IBOutlet UIButton *poopButton;
@property (weak, nonatomic) IBOutlet UIButton *peeButton;


@end

@implementation DiaperChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)poopButtonPressed:(id)sender {
    PoopTypeSelectionViewController *v = [[PoopTypeSelectionViewController alloc] init];
//    v.view.backgroundColor = [UIColor redColor];
//    v.popoverPresentationController.delegate = self;
//    v.preferredContentSize = CGSizeMake(320, 400);
//    CGRect rect = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 1, 1);
//    UIPopoverController *controller = [[UIPopoverController alloc]initWithContentViewController:v];
//    [controller presentPopoverFromRect:rect
//                                       inView:self.view
//                     permittedArrowDirections:UIPopoverArrowDirectionUnknown
//                                     animated:YES];
    if(popController ==nil) {
        
    popController = [[WYPopoverController alloc] initWithContentViewController:v];
    popController.delegate = self;
    popController.passthroughViews = @[self.poopButton];
    popController.popoverLayoutMargins = UIEdgeInsetsMake(50, 50, 50, 50);
    popController.wantsDefaultContentAppearance = NO;
        
    }

    [popController presentPopoverAsDialogAnimated:YES options:WYPopoverAnimationOptionFadeWithScale];
    
//    [self presentViewController:controller animated:YES completion:nil];
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
////    alertController.preferredStyle = UIAlertControllerStyleAlert;
//    alertController.view.bounds = CGRectMake(0, 0, 800, 800);
//    [alertController setValue:v forKey:@"contentViewController"];
//    alertController.view.frame = CGRectMake(0, 0, 400, 400);
//    [self presentViewController:alertController animated:YES completion:nil];
    
    
        PoopTypeSelectionViewController *controller = [[PoopTypeSelectionViewController alloc]init];
   [self.navigationController pushViewController:controller animated:YES];
    
    
    
    
    
}

#pragma mark - WYPopoverControllerDelegate

- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller
{
    NSLog(@"popoverControllerDidPresentPopover");
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
//    if (controller == anotherPopoverController)
//    {
//        anotherPopoverController.delegate = nil;
//        anotherPopoverController = nil;
//    }
//    else if (controller == popController)
//    {
        popController.delegate = nil;
        popController = nil;
//    }
}

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(WYPopoverController *)popoverController
{
    return YES;
}

- (void)popoverController:(WYPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value
{
    // keyboard is shown and the popover will be moved up by 163 pixels for example ( *value = 163 )
    *value = 0; // set value to 0 if you want to avoid the popover to be moved
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)preeButtonPressed:(id)sender {
    
    PeeTypeSelectionViewController *controller = [[PeeTypeSelectionViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
    
}
@end
