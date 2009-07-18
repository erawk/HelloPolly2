//
//  PolygonShape.h
//  WhatATool2
//
//  Created by Ed on 28/06/09.
//  Copyright 2009 Ed Lui. All rights reserved.
//

#define kMinimumNumberOfSides 3
#define kMaximumNumberOfSides 12

@interface PolygonShape : NSObject {
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
}

@property (nonatomic) int numberOfSides;
@property (nonatomic) int minimumNumberOfSides;
@property (nonatomic) int maximumNumberOfSides;

@property(readonly) float angleInDegrees;
@property(readonly) float angleInRadians;
@property(readonly) NSString *name;

- (id)initWithNumberOfSides:(int)sides;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;

- (BOOL)isValidNumberOfSides:(int)sides;
- (BOOL)isValidMinimumNumberOfSides:(int)sides;
- (BOOL)isValidMaximumNumberOfSides:(int)sides;

- (NSString *)description;

@end
