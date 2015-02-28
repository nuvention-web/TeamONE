//
//  CustomTableFooter.m
//  BabyNinja
//
//  Created by Sneha on 2/27/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import "CustomTableFooter.h"

@implementation CustomTableFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)init{
   self =  [super init];
    
    if(self){
        self = [[[NSBundle mainBundle] loadNibNamed:@"CustomTableFooter" owner:self options:nil] objectAtIndex:0];
        self.customMessage.frame = CGRectMake(5, 5, 25,25);
        self.logoImage.frame = CGRectMake(35, 5, 220, 25);
        self.customMessage.text = @"Made with love in Evanston";
        self.logoImage.image = [UIImage imageNamed:@"ninja"];
        NSLog(@"%f %f %f %f", self.customMessage.frame.origin.x, self.customMessage.frame.origin.y,self.logoImage.frame.origin.x,self.logoImage.frame.origin.y);
    }
    
    return self;
}

@end
