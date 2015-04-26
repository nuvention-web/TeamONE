//
//  FeedActivityViewController.h
//  BabyNinja
//
//  Created by Sneha on 4/26/15.
//  Copyright (c) 2015 TeamONE Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeedActivityProtocol <NSObject>

-(void)feedRecorded:(BabyActivity*)activity;  //TODO: change the BabyActivity type

@end

@interface FeedActivityViewController : UIViewController

@property (nonatomic, assign) id <FeedActivityProtocol> delegate;

@end
