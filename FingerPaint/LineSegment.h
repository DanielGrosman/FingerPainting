//
//  LineSegment.h
//  FingerPaint
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LineSegment : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;



- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second;

@end
