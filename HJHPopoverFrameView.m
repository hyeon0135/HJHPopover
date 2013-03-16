//
//  HJHPopoverFrameView.m
//  Popover
//
//  Created by Jonghwan Hyeon on 3/16/13.
//  Copyright (c) 2013 Jonghwan Hyeon. All rights reserved.
//

#import "HJHPopoverFrameView.h"

@implementation HJHPopoverFrameView
- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor blueColor] set];
    NSRectFill([self frame]);
}
@end
