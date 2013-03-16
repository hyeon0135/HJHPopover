//
//  HJHPopoverFrameView.m
//  Popover
//
//  Created by Jonghwan Hyeon on 3/16/13.
//  Copyright (c) 2013 Jonghwan Hyeon. All rights reserved.
//

#import "HJHPopoverFrameView.h"

#define ARROW_WIDTH 20
#define ARROW_HEIGHT 10
#define CORNER_RADIUS 5

@implementation HJHPopoverFrameView
- (void)drawRect:(NSRect)dirtyRect
{
    NSRect bounds = self.bounds;
    
    NSRect backgroundBounds = bounds;
    NSBezierPath *arrowPath = [NSBezierPath bezierPath];
    switch (self.edge) {
        case NSMinXEdge:
            [arrowPath moveToPoint:NSMakePoint(NSMaxX(bounds), NSMidY(bounds))];
            [arrowPath lineToPoint:NSMakePoint(NSMaxX(bounds) - ARROW_HEIGHT, NSMidY(bounds) - (ARROW_WIDTH / 2.0f))];
            [arrowPath lineToPoint:NSMakePoint(NSMaxX(bounds) - ARROW_HEIGHT, NSMidY(bounds) + (ARROW_WIDTH / 2.0f))];
            
            backgroundBounds.size.width -= ARROW_HEIGHT;
            break;
            
        case NSMinYEdge:
            [arrowPath moveToPoint:NSMakePoint(NSMidX(bounds), NSMinY(bounds))];
            [arrowPath lineToPoint:NSMakePoint(NSMidX(bounds) - (ARROW_WIDTH / 2.0f), NSMinY(bounds) + ARROW_HEIGHT)];
            [arrowPath lineToPoint:NSMakePoint(NSMidX(bounds) + (ARROW_WIDTH / 2.0f), NSMinY(bounds) + ARROW_HEIGHT)];
            
            backgroundBounds.origin.y += ARROW_HEIGHT;
            backgroundBounds.size.height -= ARROW_HEIGHT;
            break;
            
        case NSMaxXEdge:
            [arrowPath moveToPoint:NSMakePoint(NSMinX(bounds), NSMidY(bounds))];
            [arrowPath lineToPoint:NSMakePoint(NSMinX(bounds) + ARROW_HEIGHT, NSMidY(bounds) - (ARROW_WIDTH / 2.0f))];
            [arrowPath lineToPoint:NSMakePoint(NSMinX(bounds) + ARROW_HEIGHT, NSMidY(bounds) + (ARROW_WIDTH / 2.0f))];
            
            backgroundBounds.origin.x += ARROW_HEIGHT;
            backgroundBounds.size.width -= ARROW_HEIGHT;
            break;
            
        case NSMaxYEdge:
            [arrowPath moveToPoint:NSMakePoint(NSMidX(bounds), NSMaxY(bounds))];
            [arrowPath lineToPoint:NSMakePoint(NSMidX(bounds) - (ARROW_WIDTH / 2.0f), NSMaxY(bounds) - ARROW_HEIGHT)];
            [arrowPath lineToPoint:NSMakePoint(NSMidX(bounds) + (ARROW_WIDTH / 2.0f), NSMaxY(bounds) - ARROW_HEIGHT)];
            
            backgroundBounds.size.height -= ARROW_HEIGHT;
            break;
    }
    
    NSBezierPath *backgroundPath = [NSBezierPath bezierPath];
    [backgroundPath appendBezierPathWithRoundedRect:backgroundBounds xRadius:CORNER_RADIUS yRadius:CORNER_RADIUS];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path appendBezierPath:arrowPath];
    [path appendBezierPath:backgroundPath];
    
    [[NSColor whiteColor] setFill];
    [path fill];
}
@end
