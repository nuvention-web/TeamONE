//
//  DiaperChangeViewController.m
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "DiaperChangeViewController.h"
#import "PoopTypeSelectionView.h"
#import "PeeTypeSelectionViewController.h"

@interface DiaperChangeViewController ()< >{

}
@property (weak, nonatomic) IBOutlet UIButton *poopButton;
@property (weak, nonatomic) IBOutlet UIButton *peeButton;


@end

@implementation DiaperChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)poopButtonPressed:(id)sender {
    
    PoopTypeSelectionView *controller = [[PoopTypeSelectionView alloc] init];
    controller.backgroundColor = [UIColor clearColor];
    //    controller.backgroundColor = [UIColor blackColor];
    controller.frame = CGRectMake(0 , 0 , 375, 667);
    controller.alpha = 0;
    [self.view addSubview:controller];
    [UIView animateWithDuration:0.5 animations:^{
        
        controller.alpha = 1.0;
    }];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)peeButtonPressed:(id)sender {
    
    PeeTypeSelectionViewController *controller = [[PeeTypeSelectionViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
    
}
@end
