//
//  main.m
//  UIDevice-C14
//
//  Created by BobZhang on 16/6/1.
//  Copyright © 2016年 BobZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - TestBedViewController

@interface TestBedViewController : UIViewController
@end

@implementation TestBedViewController

- (void)loadView
{
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    //00Test
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(showOrientation:) userInfo:nil repeats:YES];
    
    //08Test
    self.navigationItem.rightBarButtonItem=BARBUTTON(@"Action", @selector(FileSpaceAction));
}

#pragma mark - 00 Orientation
- (void)showOrientation:(NSNotification *)notification
{
    //    NSString *orientationString = [UIDevice orientationString:[UIDevice currentDevice].acceleratorBasedOrientation];
    //    NSLog(@"%@", orientationString);
    //    self.title = orientationString;
}

#pragma mark - 08 File Space
-(void)FileSpaceAction{
    NSFileManager *fm=[NSFileManager defaultManager];
    NSDictionary *fsAttributesDic = [fm attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumberFormatter *numberFormatter=[[NSNumberFormatter alloc]init];
    numberFormatter.numberStyle=NSNumberFormatterDecimalStyle;
    NSNumber *fileSystemSize=[fsAttributesDic objectForKey:NSFileSystemSize];
    NSLog(@"System space: %@ bytes", [numberFormatter stringFromNumber:fileSystemSize]);
    NSLog(@"System space: %@ megabytes", [numberFormatter stringFromNumber:[NSNumber numberWithLongLong:fileSystemSize.longLongValue / 1024 / 1024]]);
    NSNumber *fileSystemFreeSize=[fsAttributesDic objectForKey:NSFileSystemFreeSize];
    NSLog(@"System free space: %@ bytes", [numberFormatter stringFromNumber:fileSystemFreeSize]);
    NSLog(@"System space: %@ megabytes", [numberFormatter stringFromNumber:[NSNumber numberWithLongLong:fileSystemFreeSize.longLongValue / 1024 / 1024]]);
}

@end


#pragma mark - Application Setup

@interface TestBedAppDelegate : NSObject <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow *window;
@end

@implementation TestBedAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.tintColor = COOKBOOK_PURPLE_COLOR;
    TestBedViewController *tbvc = [[TestBedViewController alloc] init];
    tbvc.edgesForExtendedLayout = UIRectEdgeNone;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tbvc];
    _window.rootViewController = nav;
    [_window makeKeyAndVisible];
    return YES;
}

@end

#pragma mark - main
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([TestBedAppDelegate class]));
    }
}
