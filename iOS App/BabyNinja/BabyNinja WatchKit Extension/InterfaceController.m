//
//  InterfaceController.m
//  BabyNinja WatchKit Extension
//
//  Created by Sneha on 2/4/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)poopButtonPressed:(id)sender {
    
//    [self changePoopButtonStateImage];
//    [self.radialMenu buttonsWillAnimateFromButton:sender withFrame:self.poopButton.frame inView:self.view];
}

//-(void)changePoopButtonStateImage{
//    if(self.poopButton.==0){
//        self.poopButton.tag = 1 ; //setting the mode to selected
//        [self.poopButton setImage:[UIImage imageNamed:@"greenTick"] forState:UIControlStateNormal];
//    } else {
//        self.poopButton.tag = 0 ; //setting the mode to unselected
//        [self.poopButton setImage:[UIImage imageNamed:@"poop"] forState:UIControlStateNormal];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"You are left with just 8 diapers. Order more!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alert show];
//    }
//}
//
//#pragma mark - radial menu delegate methods
//- (NSInteger) numberOfItemsInRadialMenu:(ALRadialMenu *)radialMenu {
//    //FIXME: dipshit, change one of these variable names
//    if (radialMenu == self.radialMenu)
//        return 8;
//    
//    
//    return 0;
//}
//
//
//- (NSInteger) arcSizeForRadialMenu:(ALRadialMenu *)radialMenu {
//    if (radialMenu == self.radialMenu)
//        return 360;
//    
//    return 0;
//}
//
//
//- (NSInteger) arcRadiusForRadialMenu:(ALRadialMenu *)radialMenu {
//    //    if (radialMenu == self.radialMenu)
//    return 150;
//    
//}
//
//
//- (ALRadialButton *) radialMenu:(ALRadialMenu *)radialMenu buttonForIndex:(NSInteger)index {
//    ALRadialButton *button = [[ALRadialButton alloc] init];
//    if (radialMenu == self.radialMenu) {
//        if (index == 1) {
//            [button setImage:[UIImage imageNamed:@"dribbble"] forState:UIControlStateNormal];
//        } else if (index == 2) {
//            [button setImage:[UIImage imageNamed:@"youtube"] forState:UIControlStateNormal];
//        } else if (index == 3) {
//            [button setImage:[UIImage imageNamed:@"vimeo"] forState:UIControlStateNormal];
//        } else if (index == 4) {
//            [button setImage:[UIImage imageNamed:@"pinterest"] forState:UIControlStateNormal];
//        } else if (index == 5) {
//            [button setImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
//        } else if (index == 6) {
//            [button setImage:[UIImage imageNamed:@"instagram500"] forState:UIControlStateNormal];
//        } else if (index == 7) {
//            [button setImage:[UIImage imageNamed:@"email"] forState:UIControlStateNormal];
//        } else if (index == 8) {
//            [button setImage:[UIImage imageNamed:@"googleplus-revised"] forState:UIControlStateNormal];
//        }
//        //        } else if (index == 9) {
//        //            [button setImage:[UIImage imageNamed:@"facebook500"] forState:UIControlStateNormal];
//        //        }
//        //
//    }
//    
//    if (button.imageView.image) {
//        return button;
//    }
//    
//    return nil;
//}
//
//- (float) buttonSizeForRadialMenu:(ALRadialMenu *)radialMenu{
//    return 50.0;
//}
//
//- (void) radialMenu:(ALRadialMenu *)radialMenu didSelectItemAtIndex:(NSInteger)index {
//    
//    NSLog(@"%ld", (long)index);
//    if (radialMenu == self.radialMenu) {
//        ALRadialButton *button = [radialMenu.items objectAtIndex:index-1];
//        if(button.selected ==0){
//            if(index<=4){
//                self.selectedColorIndex = index;
//                for (int i=1; i<=4; i++) {
//                    [self removeSelectedImageFromButton:[radialMenu.items objectAtIndex:i-1]];
//                }
//            } else{
//                self.selectedTextureIndex = index;
//                for (int i=5; i<=8; i++) {
//                    [self removeSelectedImageFromButton:[radialMenu.items objectAtIndex:i-1]];
//                }
//            }
//            [self addSelectedImageFromButton:button];
//        } else
//            [self removeSelectedImageFromButton:button];
//        if(index<=4){
//            self.selectedColorIndex = 0;
//        } else{
//            self.selectedTextureIndex = 0;
//        }
//        
//    }
//    NSLog(@"%ld %ld", (long)self.selectedTextureIndex, (long)self.selectedColorIndex);
//}
//
//
//-(void)removeSelectedImageFromButton:(ALRadialButton*)button{
//    button.selected = 0;
//    for(UIView *view in button.subviews)
//        if(view.tag==100)
//            [view removeFromSuperview];
//}
//
//-(void)addSelectedImageFromButton:(ALRadialButton*)button{
//    button.selected = 1;
//    UIImageView *tickImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"circle"]];
//    tickImageView.tag = 100;
//    [button addSubview:tickImageView];
//    
//}


@end



