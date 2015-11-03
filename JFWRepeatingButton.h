//
//  JFWRepeatingButton.h
//
//  Created by Julian Weinert on 12/03/15.
//  Licensed under the WTFPL.
//

#import <UIKit/UIKit.h>

@interface JFWRepeatingButton : UIButton

@property (nonatomic, assign) IBInspectable double threshhold;
@property (nonatomic, assign) IBInspectable double repeatInterval;
@property (nonatomic, assign) IBInspectable double accellerationFactor;
@property (nonatomic, assign) IBInspectable double accellerationInterval;

@end
