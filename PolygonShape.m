//
//  PolygonShape.m
//  WhatATool2
//
//  Created by Ed on 28/06/09.
//  Copyright 2009 Ed Lui. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

#pragma mark Initialization methods

- (void)dealloc {
//    NSLog(@"dealloc is being called");
    [super dealloc];
}

- (id)init {
    return [self initWithNumberOfSides:kMinimumNumberOfSides minimumNumberOfSides:kMinimumNumberOfSides maximumNumberOfSides:kMaximumNumberOfSides];
}

- (id)initWithNumberOfSides:(int)sides {
    return [self initWithNumberOfSides:sides minimumNumberOfSides:kMinimumNumberOfSides maximumNumberOfSides:kMaximumNumberOfSides];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min {
    return [self initWithNumberOfSides:sides minimumNumberOfSides:min maximumNumberOfSides:kMaximumNumberOfSides];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
    if (self = [super init]) {
        minimumNumberOfSides = kMinimumNumberOfSides;
        maximumNumberOfSides = kMaximumNumberOfSides;
        numberOfSides = minimumNumberOfSides;

        [self setNumberOfSides:sides];
        [self setMinimumNumberOfSides:min];
        [self setMaximumNumberOfSides:max];
    }

    return self;
}

#pragma mark Setter methods

// use a validation to ensure sides is within min and max
- (void)setNumberOfSides:(int)sides { 
    if (sides != numberOfSides && [self isValidNumberOfSides:sides]) { 
        numberOfSides = sides;
    }
} 

// use a validation to ensure minimum sides is greater than 2, less than maximum
- (void)setMinimumNumberOfSides:(int)sides { 
    if (sides != minimumNumberOfSides && [self isValidMinimumNumberOfSides:sides]) { 
        minimumNumberOfSides = sides;
    }
} 

// use a validation to ensure maximium is less than or equal to 12, greater than minimum
- (void)setMaximumNumberOfSides:(int)sides {
    if (sides != maximumNumberOfSides && [self isValidMaximumNumberOfSides:sides]) { 
        maximumNumberOfSides = sides;
    }
} 

#pragma mark Validation methods

// validation method to ensure sides are within min and max
- (BOOL)isValidNumberOfSides:(int)sides {
    if (sides < minimumNumberOfSides) {
//        NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", sides, minimumNumberOfSides);
        return NO;
    }

    if (sides > maximumNumberOfSides) {
//        NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", sides, maximumNumberOfSides);
        return NO;
    }

    return YES;
}

// validation method to ensure side is greater than 2, and smaller than max
- (BOOL)isValidMinimumNumberOfSides:(int)sides {
    if (sides < 3) {
//        NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", sides, minimumNumberOfSides);
        return NO;
    }

    if (sides >= [self maximumNumberOfSides]) {
//        NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", sides, maximumNumberOfSides);
        return NO;
    }

    return YES;
}

// validation method to ensure side is less than or equal to 12, and greater than min
- (BOOL)isValidMaximumNumberOfSides:(int)sides {
    if (sides > 12) {
//        NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", sides, minimumNumberOfSides);
        return NO;
    }

    if (sides <= [self minimumNumberOfSides]) {
        return NO;
    }
    
    return YES;
}

#pragma mark Angle methods

// angle in degrees is (180 * (numberOfSides - 2)) / numberOfSides
- (float)angleInDegrees {
    // return (float) ((180 * ([self numberOfSides] - 2)) / (float)[self numberOfSides]);
    return (180.0 * ([self numberOfSides] - 2)) / [self numberOfSides];
}

// angle in radians is (angle in degrees * pi) / 180 
- (float)angleInRadians {
    // return (float) ([self angleInDegrees] * ( M_PI / (float) 180));
    return [self angleInDegrees] * (M_PI / 180.0);
}

#pragma mark Name and description methods

// array of shape names, with numberOfSides as index
- (NSString *)name {
    NSArray *shapeNames = [[NSArray alloc] initWithObjects: 
     @"Impossible", @"Monogan", @"Digon", @"Triangle", @"Rectangle", @"Pentagon", @"Hexagon", 
     @"Heptagon", @"Octagon", @"Nonagon", @"Decagon", @"Hendagon", @"Dodecagon", nil];
    [shapeNames autorelease];

    return [shapeNames objectAtIndex:(numberOfSides)];
}

- (NSString *)description {
    NSString *description = [NSString 
             stringWithFormat:@"Hello, I am a %d-sided polygon (aka a %@) with angles of %d degrees (%.6f radians).",
             numberOfSides, [self name], (int) [self angleInDegrees], [self angleInRadians]];
    return description;
}

@end
