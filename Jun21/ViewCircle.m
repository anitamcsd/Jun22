//
//  ViewCircle.m
//  Jun21
//
//  Created by Anita Gupta on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewCircle.h"

@implementation ViewCircle

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    
    if (self) {
        
        CGFloat w = self.bounds.size.width;
        CGFloat h = self.bounds.size.height;
        self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
        //self.background=[UIColor greenColor];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 
    CGRect bounds = self.bounds;
    CGFloat radius = .3 * bounds.size.width;	//in pixels
    
 
    CGRect r = CGRectMake(
                          bounds.origin.x,
                          bounds.origin.y,
                          2 * radius,
                          2 * radius
                          );
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
    CGContextFillPath(c);
}

@end
