//
//  DrawingView.m
//  FingerPaint
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "DrawingView.h"
#import "LineSegment.h"


@interface DrawingView()
@property (nonatomic) NSMutableArray <LineSegment *>* line;
@end

@implementation DrawingView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _line = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Touch Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:first];
    [self.line addObject:segment];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint second = [touch locationInView:self];
    CGPoint first = [touch previousLocationInView:self];
    NSLog(@"%d: %@, %@", __LINE__, NSStringFromCGPoint(first), NSStringFromCGPoint(second));
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:second];
    [self.line addObject:segment];
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    UIColor *gray = [UIColor grayColor];
    [gray setStroke];
    for (LineSegment *segment in self.line) {
        if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
            [path moveToPoint:segment.firstPoint];
            continue;
        }
        [path addLineToPoint:segment.firstPoint];
        [path addLineToPoint:segment.secondPoint];
    }
    [path stroke];
}

- (void)clear {
    [self.line removeAllObjects];
    [self setNeedsDisplay];
}


@end
