//
//  DiaperChangeViewController.m
//  BabyNinja
//
//  Created by Sneha on 3/10/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "DiaperChangeViewController.h"
#import "PeeTypeSelectionViewController.h"

PoopTypeSelectionView *poopTypeView;
PeeTypeSelectionViewController *peeTypeView;

@interface DiaperChangeViewController ()<PoopTypeSelectionViewDelegate, peeTypeSelectionViewDelegate>{
   
}

@property (weak, nonatomic) IBOutlet UIButton *poopButton;
@property (weak, nonatomic) IBOutlet UIButton *peeButton;
//@property (strong, nonatomic) PoopTypeSelectionView *poopTypeView;

@end

@implementation DiaperChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(poopTypeRecorded:) name:@"poopRecorded" object:nil];

    
    poopTypeView = [[PoopTypeSelectionView alloc] init];
    poopTypeView.delegate = self;
    
    peeTypeView = [[PeeTypeSelectionViewController alloc] init];
    peeTypeView.delegate=self;
    
    
    
    
    //    poopTypeView.poopTypedelegate = self;
//    poopTypeView.frame = CGRectMake(0, 0, 375, 667);
//    poopTypeView.alpha = 0.0;
    
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
    
    
    [self.navigationController pushViewController:poopTypeView animated:YES];

//    [self.view addSubview:poopTypeView];
//    [UIView animateWithDuration:0.5 animations:^{
//        
//        poopTypeView.alpha = 1.0;
//    }];

}

#pragma mark PoopTypeSelectionDelegate methods

-(void)poopTypeRecorded:(Activity*)activity{
    
//    Poop *poop = [notification object];
//    [UIView animateWithDuration:0.5 animations:^{
//        poopTypeView.hidden = YES;
//    }];
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(removePoopTypeView) userInfo:nil repeats:NO];
    NSLog(@"here again");
    
    [self.delegate diaperChangeRecorded:activity];
    
}


-(void)peeTypeRecorded:(Activity*)activity{

    NSLog(@"here again");
    
    [self.delegate diaperChangeRecorded:activity];
    
}


//-(void)removePoopTypeView{
//    [poopTypeView removeFromSuperview];
//}

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
