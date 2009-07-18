#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonShapeView.h"

@interface Controller : UIViewController {
    IBOutlet UIButton *decreaseSidesButton;
    IBOutlet UIButton *increaseSidesButton;

    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet UILabel *degreesLabel;
    IBOutlet UILabel *radiansLabel;
    IBOutlet UILabel *minSidesLabel;
    IBOutlet UILabel *maxSidesLabel;

    PolygonShape *polygon;
}

@property (nonatomic, retain) IBOutlet PolygonShape *polygon;

- (IBAction)decreaseSides:(id)sender;
- (IBAction)increaseSides:(id)sender;

- (void)updateInterface;

@end
