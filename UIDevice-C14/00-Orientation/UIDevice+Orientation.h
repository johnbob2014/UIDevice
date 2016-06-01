//
//  UIDevice+Orientation.h
//  UIDevice-C14
//
//  Created by BobZhang on 16/6/1.
//  Copyright © 2016年 BobZhang. All rights reserved.
//

@import UIKit;
@import CoreMotion;

@interface UIDevice (Orientation)

- (float)orientationAngleRelativeToOrientation:(UIDeviceOrientation)someOrientation;
+ (NSString *)orientationString:(UIDeviceOrientation)orientation;

@property (nonatomic, readonly) BOOL isLandscape;
@property (nonatomic, readonly) BOOL isPortrait;
@property (nonatomic, readonly) NSString *orientationString;
@property (nonatomic, readonly) float orientationAngle;
@property (nonatomic, readonly) UIDeviceOrientation acceleratorBasedOrientation;

@end
