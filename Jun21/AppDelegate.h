//
//  AppDelegate.h
//  Jun21
//
//  Created by Anita Gupta on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
