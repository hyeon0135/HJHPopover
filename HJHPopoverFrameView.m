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
    NSPoint pointOfArrow = [self pointOfArrowOnEdge:self.edge];
    NSBezierPath *pathOfArrow = [self bezierPathOfArrowAtPoint:pointOfArrow onEdge:self.edge];
    
    NSRect boundsOfBackground = [self boundsOfBackgroundOnEdge:self.edge];
    NSBezierPath *pathOfBackground = [NSBezierPath bezierPath];
    [pathOfBackground appendBezierPathWithRoundedRect:boundsOfBackground xRadius:CORNER_RADIUS yRadius:CORNER_RADIUS];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path appendBezierPath:pathOfArrow];
    [path appendBezierPath:pathOfBackground];
    
    [[NSColor whiteColor] setFill];
    [path fill];
}

- (NSPoint)pointOfArrowOnEdge:(NSRectEdge)edge
{
    NSRect bounds = self.bounds;
    NSPoint point = NSMakePoint(NSMidX(bounds), NSMidY(bounds));
    
    CGFloat (*converter[])(NSRect rect) = { NSMaxX, NSMaxY, NSMinX, NSMinY };
    CGFloat *pointsToBeModified[] = { &point.x, &point.y, &point.x, &point.y };
    
    *(pointsToBeModified[edge]) = (converter[edge])(bounds);
    
    return point;
}

- (NSBezierPath *)bezierPathOfArrowAtPoint:(NSPoint)point onEdge:(NSRectEdge)edge
{
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path moveToPoint:point];
    
    CGFloat directions[] = { -1, -1, +1, +1 };
    CGFloat modifier = directions[edge] * ARROW_HEIGHT;
    switch (edge) {
        case NSMinXEdge:
        case NSMaxXEdge:
            [path lineToPoint:NSMakePoint(point.x + modifier, point.y + (ARROW_WIDTH / 2.0f))];
            [path lineToPoint:NSMakePoint(point.x + modifier, point.y - (ARROW_WIDTH / 2.0f))];
            break;
            
        case NSMinYEdge:
        case NSMaxYEdge:
            [path lineToPoint:NSMakePoint(point.x + (ARROW_WIDTH / 2.0f), point.y + modifier)];
            [path lineToPoint:NSMakePoint(point.x - (ARROW_WIDTH / 2.0f), point.y + modifier)];
            break;
    }
    [path lineToPoint:point];
    [path closePath];
    
    return path;
}

- (NSRect)boundsOfBackgroundOnEdge:(NSRectEdge)edge
{
    NSRect bounds = self.bounds;
    
    CGFloat modifiers[] = { 0.0f, 0.0f, ARROW_HEIGHT, ARROW_HEIGHT };
    switch (edge) {
        case NSMinXEdge:
        case NSMaxXEdge:
            bounds.origin.x += modifiers[edge];
            bounds.size.width -= ARROW_HEIGHT;
            break;
            
        case NSMinYEdge:
        case NSMaxYEdge:
            bounds.origin.y += modifiers[edge];
            bounds.size.height -= ARROW_HEIGHT;
            break;
    }
    
    return bounds;
}
@end
