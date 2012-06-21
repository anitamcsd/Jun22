//
//  View.m
//  Jun21
//
//  Created by Anita Gupta on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
  	//Fill a right triangle.
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width/2, size.height/2);
	CGFloat length = min * 5 / 8;           //of side
    
	CGContextRef c = UIGraphicsGetCurrentContext();
    
	//origin at right angle
	CGContextTranslateCTM(c,
                          (size.width + length) / 2,
                          (size.height + length) / 2
                          );
	CGContextScaleCTM(c, 1, -1);
    
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, -50, -50);          //lower right vertex (the right angle)
	CGContextAddLineToPoint(c, 0, length);  //upper right vertex
	CGContextAddLineToPoint(c, -length, 0); //lower left vertex
	CGContextClosePath(c);                  //back to starting point
    
	CGContextSetRGBFillColor(c, 0.4, 0.6, 0.8, 1.0);
    
    CGContextSetShadow(c, CGSizeMake(10, -20), 5);
	CGContextFillPath(c);
    
    
    CGRect bounds = self.bounds;
    CGFloat radius = .2 * bounds.size.width;	//in pixels
    
    
    CGRect r = CGRectMake(
                          bounds.origin.x,
                          bounds.origin.y,
                          2 * radius,
                          2 * radius
                          );
    
    //circle
    CGContextMoveToPoint(c, 100, -100);
    c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    CGContextAddEllipseInRect(c, r);
    CGContextSetShadow(c, CGSizeMake(10, -20), 5);

    CGContextSetRGBFillColor(c, 1.0, 0.0, 1.0, 1.0);	//red, opaque
    CGContextFillPath(c);
    
    //rectangle
    size = self.bounds.size;
    min = MIN(size.width, size.height);
	CGFloat longSide = min * 15 / 16;
	CGFloat shortSide = longSide / 3;
    
    c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
    
	CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
	CGContextScaleCTM(c, 1,-1);                               //make Y axis point up
    
	CGRect horizontal = CGRectMake(-longSide / 2, -shortSide / 2, longSide, shortSide);
	CGContextAddRect(c, horizontal);
	CGContextRotateCTM(c, 90 * M_PI / 180);	//90 degrees clockwise
	CGContextAddRect(c, horizontal);
    
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
}

@end
