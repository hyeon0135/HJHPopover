//
//  HJHPopoverWindow.m
//  Popover
//
//  Created by Jonghwan Hyeon on 3/15/13.
//  Copyright (c) 2013 Jonghwan Hyeon. All rights reserved.
//

#import "HJHPopoverWindow.h"

#import "HJHPopoverFrameView.h"

@interface HJHPopoverWindow()
@property (nonatomic, strong) NSView *frameContentView;
@end

@implementation HJHPopoverWindow
- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)windowStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)deferCreation
{
    NSAssert(bufferingType == NSBackingStoreBuffered, @"window's buffering type == NSBackingStoreBuffered");
    self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:bufferingType defer:NO];
    if (!self) return nil;
        
    return self;
}

- (void)setContentView:(NSView *)aView
{
    if (self.frameContentView == aView) return ;
    
    NSRect bounds = self.frame;
    bounds.origin = NSZeroPoint;
    
    NSView *frameView = super.contentView;
    if (!frameView) {
        frameView = [[HJHPopoverFrameView alloc] initWithFrame:bounds];
        super.contentView = frameView;
    }
    
    if (self.frameContentView) [self.frameContentView removeFromSuperview];
    self.frameContentView = aView;
    self.frameContentView.bounds = bounds;
    self.frameContentView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    
    [frameView addSubview:self.frameContentView];
}

- (id)contentView
{
    return self.frameContentView;
}

- (BOOL)canBecomeKeyWindow
{
    return YES;
}
@end
