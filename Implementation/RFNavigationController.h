/*!
 RFNavigationController
 
 Copyright © 2019 BB9z
 https://github.com/RFUI/RFNavigationController
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */

#import <Cocoa/Cocoa.h>

@class RFNavigationController;

@interface NSViewController (RFNavigationController)
@property (readonly, nullable, nonatomic) RFNavigationController *rfNavigationController;
@end

@interface RFNavigationController : NSViewController

- (void)setViewControllers:(nullable NSArray<NSViewController *> *)viewControllers animated:(BOOL)animated;
- (void)pushViewController:(nullable NSViewController *)viewController animated:(BOOL)animated;
- (nullable NSViewController *)popViewControllerAnimated:(BOOL)animated;

@property (readonly, nullable) NSViewController *topViewController;
@property (readonly, nonatomic) NSArray<__kindof NSViewController *> *viewControllers;
@end
