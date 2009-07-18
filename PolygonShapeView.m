//
//  PolygonShapeView.m
//  HelloPoly2
//
//  Created by Ed on 12/07/09.
//  Copyright 2009 Ed Lui. All rights reserved.
//

#import "PolygonShapeView.h"


@implementation PolygonShapeView

@synthesize polygon;

- (void)dealloc {
    [polygon release];
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect: %@", [polygon description]);
    self.backgroundColor = [UIColor whiteColor];

    [self drawPoly:rect];
    [self showShapeNameLabel];
}

// create a shape name label and add as subview on the fly
// might be more efficient to get a handle and update
- (void)showShapeNameLabel {
    CGRect frame = CGRectMake(75, 145, 150, 25);
    UILabel *shapeNameLabel = [[UILabel alloc] initWithFrame:frame];
    shapeNameLabel.backgroundColor = [self fillColor];
    shapeNameLabel.textColor = [UIColor whiteColor];
    shapeNameLabel.text = [NSString stringWithFormat:@"%@", [polygon name]];
    shapeNameLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:shapeNameLabel];
    [shapeNameLabel release];
}

- (void)drawPoly:(CGRect)rect {
    // get context and set bg color to gray
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor grayColor] set]; 
    UIRectFill([self bounds]);

    // get array of points and draw a path starting with the first object
    NSArray *myPoints = [PolygonShapeView pointsForPolygonInRect:rect numberOfSides:[polygon numberOfSides]];
    NSValue *firstValue = [myPoints objectAtIndex:0];
    CGPoint firstPoint = [firstValue CGPointValue];
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);

    // create range and loop through remainder
    NSRange everythingButFirst;
    everythingButFirst.location = 1;
    everythingButFirst.length = [myPoints count] - 1;
    for (NSValue *myValue in [myPoints subarrayWithRange:everythingButFirst]) {
        CGPoint myPoint = [myValue CGPointValue];
        CGContextAddLineToPoint(context, myPoint.x, myPoint.y);
    }
    CGContextClosePath(context);

    // set color dynamically using a black stroke
    [[self fillColor] setFill];
    [[UIColor blackColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (CGFloat)colorFloat {
    return ((CGFloat)([polygon numberOfSides] - [polygon minimumNumberOfSides] + 1)) / ([polygon maximumNumberOfSides] - [polygon minimumNumberOfSides] + 1);
}

- (UIColor *)fillColor {
    return [UIColor colorWithRed:([self colorFloat] * 2.0)
                        green:([self colorFloat] * 0.5)
                         blue:[self colorFloat]
                        alpha:100.0];
}

// from the class notes
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
    float radius = 0.9 * center.x; 
    NSMutableArray *result = [NSMutableArray array]; 
    float angle = (2.0 * M_PI) / numberOfSides; 
    float exteriorAngle = M_PI - angle; 
    float rotationDelta = angle - (0.5 * exteriorAngle); 
    
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
        float newAngle = (angle * currentAngle) - rotationDelta; 
        float curX = cos(newAngle) * radius; 
        float curY = sin(newAngle) * radius; 
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
                                                                center.y + curY)]]; 
    } 
    
    return result; 
} 


@end
