//
//  JFWRepeatingButton.m
//
//  Created by Julian Weinert on 12/03/15.
//  Licensed under the WTFPL.
//

#import "JFWRepeatingButton.h"

@interface JFWRepeatingButton ()

@property (nonatomic, retain) NSTimer *delayTimer;
@property (nonatomic, retain) NSTimer *repeatingTimer;
@property (nonatomic, retain) NSTimer *accellerationTimer;

@property (atomic, assign) BOOL eventReactionPaused;

@end

@implementation JFWRepeatingButton

+ (id)buttonWithType:(UIButtonType)buttonType {
	return [[self alloc] init];
}

- (instancetype)init {
	if (self = [super init]) {
		[self setup];
	}
	return self;
}

- (void)awakeFromNib {
	[self setup];
}

- (void)setup {
	[self addTarget:self action:@selector(clickBegan:) forControlEvents:UIControlEventTouchDown];
	[self addTarget:self action:@selector(clickEnded) forControlEvents:UIControlEventTouchUpInside];
}

- (void)startRepeating {
	[[self delayTimer] invalidate];
	_delayTimer = nil;
	
	_repeatingTimer = [NSTimer scheduledTimerWithTimeInterval:[self repeatInterval]
													   target:self
													 selector:@selector(repeat)
													 userInfo:nil
													  repeats:YES];
}

- (void)stopRepeating {
	[[self delayTimer] invalidate];
	_delayTimer = nil;
	
	[[self repeatingTimer] invalidate];
	_repeatingTimer = nil;
}

- (void)repeat {
	_eventReactionPaused = YES;
	[self sendActionsForControlEvents:UIControlEventTouchUpInside];
	_eventReactionPaused = NO;
}

- (void)clickBegan:(id)sender {
	[self stopRepeating];
	
	if ([self repeatInterval] > 0) {
		_delayTimer = [NSTimer scheduledTimerWithTimeInterval:[self threshhold]
													   target:self
													 selector:@selector(startRepeating)
													 userInfo:nil
													  repeats:NO];
	}
	
	if ([self accellerationInterval] > 0) {
		
	}
}

- (void)clickEnded {
	if ([self eventReactionPaused]) {
		return;
	}
	
	[self stopRepeating];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
