//
//  LineSegment.m
//  FingerPaint
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment

- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second {
    if (self = [super init]) {
        _firstPoint = first;
        _secondPoint = second;
    }
    return self;
}

@end
