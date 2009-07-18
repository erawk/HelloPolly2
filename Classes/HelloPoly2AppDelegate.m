//
//  HelloPoly2AppDelegate.m
//  HelloPoly2
//
//  Created by Ed on 05/07/09.
//  Copyright Ed Lui 2009. All rights reserved.
//

#import "HelloPoly2AppDelegate.h"

@implementation HelloPoly2AppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
