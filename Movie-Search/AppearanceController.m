//
//  AppearanceController.m
//  DesignNavigation
//
//  Created by Jason Noah Choi on 2/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AppearanceController.h"
#import "MSViewController.h"

@implementation AppearanceController

+ (void)setupDefaultAppearance {
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHue:180.0/360 saturation:.42 brightness:.71 alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[UINavigationBar appearanceWhenContainedIn:[MSViewController class], nil] setBarTintColor:[UIColor colorWithHue:221.0/360 saturation:.41 brightness:.80 alpha:1.0]];

    [[UIToolbar appearance] setBarTintColor:[UIColor colorWithHue:282.0/360 saturation:.38 brightness:.84 alpha:1.0]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithHue:197.0/360 saturation:.56 brightness:.42 alpha:1.0]];
    [[UISegmentedControl appearance] setTintColor:[UIColor colorWithHue:3.0/360 saturation:.62 brightness:1.0 alpha:1.0]];
    [[UISegmentedControl appearance] setTitle:@"Color" forSegmentAtIndex:0];
    [[UISegmentedControl appearance] setTitle:@"White" forSegmentAtIndex:1];
    [[UISegmentedControl appearance] setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];

   
    
    
}

@end
