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

@interface DiaperChangeViewController (){

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
    controller.backgroundColor = [UIColor yellowColor];
    controller.frame = CGRectMake(0, 0, 400, 600);
    controller.alpha = 0.0;
    [self.view addSubview:controller];
    [UIView animateWithDuration:0.2 animations:^{
        
        self.view.alpha = 1.0;
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
