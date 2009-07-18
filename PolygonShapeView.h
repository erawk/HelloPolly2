//
//  PolygonShapeView.h
//  HelloPoly2
//
//  Created by Ed on 12/07/09.
//  Copyright 2009 Ed Lui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"

@interface PolygonShapeView : UIView {
    PolygonShape *polygon;
}

@property (nonatomic, retain) IBOutlet PolygonShape *polygon;

- (void)drawPoly:(CGRect)rect;
- (void)showShapeNameLabel;
- (CGFloat)colorFloat;
- (UIColor *)fillColor;

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
