#import "Controller.h"

@implementation Controller

@synthesize polygon;

- (IBAction)decreaseSides:(id)sender {
    [polygon setNumberOfSides:([polygon numberOfSides] - 1)];
    [self updateInterface];
}

- (IBAction)increaseSides:(id)sender {
    [polygon setNumberOfSides:([polygon numberOfSides] + 1)];    
    [self updateInterface];
}

- (void)awakeFromNib { 
    NSInteger sides = [[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfSides"];
    [numberOfSidesLabel setText:[NSString stringWithFormat:@"%i", sides]];

    // instantiate the polygon object and keep it around
    polygon = [[PolygonShape alloc] initWithNumberOfSides:sides];

    // instantiate the UIView for polygon shape
    PolygonShapeView *polygonShapeView = [[PolygonShapeView alloc] initWithFrame:CGRectMake(10.0, 160.0, 220.0, 140.0)];
    [polygonShapeView setPolygon:polygon];
    self.view = polygonShapeView;
    [polygonShapeView release];
    
    [self updateInterface];
}

- (void)viewWillDisappear:(BOOL)animated {
    // save the current default to disk
    NSInteger mySides = [polygon numberOfSides];
    [[NSUserDefaults standardUserDefaults] setInteger:mySides forKey:@"numberOfSides"];    
}

- (void)updateInterface { 
    // update number of sides, and enable/disable buttons w/alpha transparency calculations
    int sides = [polygon numberOfSides];
    increaseSidesButton.enabled = [polygon isValidMaximumNumberOfSides:(sides + 1)];
    [increaseSidesButton setAlpha:(increaseSidesButton.enabled ? 1.0 : 0.3)];
    decreaseSidesButton.enabled = [polygon isValidMinimumNumberOfSides:(sides - 1)];
    [decreaseSidesButton setAlpha:(decreaseSidesButton.enabled ? 1.0 : 0.3)];
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%i", sides];

    // update labels with information from the polygon
    degreesLabel.text = [NSString stringWithFormat:@"%i", (int) [polygon angleInDegrees]];
    radiansLabel.text = [NSString stringWithFormat:@"%.6f", [polygon angleInRadians]];
    minSidesLabel.text = [NSString stringWithFormat:@"%i", [polygon minimumNumberOfSides]];
    maxSidesLabel.text = [NSString stringWithFormat:@"%i", [polygon maximumNumberOfSides]];

    // redraw the polygon
    [self.view setNeedsDisplay];
}

- (void)dealloc {
    [polygon release];
    [super dealloc];
}

@end
