//
//  JFWRepeatingButton.h
//
//  Created by Julian Weinert on 12/03/15.
//  Copyright (c) 2015 Julian Weinert Softwareentwicklung. All rights granted.
//

#import <UIKit/UIKit.h>

@interface JFWRepeatingButton : UIButton

@property (nonatomic, assign) IBInspectable double threshhold;
@property (nonatomic, assign) IBInspectable double repeatInterval;
@property (nonatomic, assign) IBInspectable double accellerationFactor;
@property (nonatomic, assign) IBInspectable double accellerationInterval;

@end
