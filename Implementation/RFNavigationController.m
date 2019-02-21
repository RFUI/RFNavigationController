
#import "RFNavigationController.h"
#import <Quartz/Quartz.h>

@implementation NSViewController (RFNavigationController)

- (RFNavigationController *)rfNavigationController {
    __kindof NSViewController *nav = self;
    while ((nav = nav.parentViewController)) {
        if ([nav isKindOfClass:RFNavigationController.class]) return nav;
    }
    return nil;
}

@end

@interface RFNavigationController ()
@property (nonatomic) CATransition *_viewReplaceAnimation;
@end

@implementation RFNavigationController

- (void)setViewControllers:(nullable NSArray<NSViewController *> *)viewControllers animated:(BOOL)animated {
    if (!viewControllers.count) return;
    NSViewController *fromVC = self.topViewController;
    NSViewController *toVC = viewControllers.lastObject;
    
    for (NSViewController *vc in self.childViewControllers) {
        [vc removeFromParentViewController];
    }
    for (NSViewController *vc in viewControllers) {
        [self addChildViewController:vc];
    }
    [self _transitionViewControllerFrom:fromVC to:toVC animated:animated options:NSViewControllerTransitionSlideLeft];
}

- (void)pushViewController:(nullable NSViewController *)toVC animated:(BOOL)animated {
    if (!toVC) return;
    if (!self.childViewControllers.count) {
        [self setViewControllers:@[toVC] animated:animated];
        return;
    }
    
    NSViewController *fromVC = self.topViewController;
    [self addChildViewController:toVC];
    [self _transitionViewControllerFrom:fromVC to:toVC animated:animated options:NSViewControllerTransitionSlideLeft];
}

- (nullable NSViewController *)popViewControllerAnimated:(BOOL)animated {
    NSArray<NSViewController *> *vcs = self.childViewControllers;
    if (vcs.count < 2) return nil;
    NSViewController *fromVC = vcs[vcs.count - 1];
    NSViewController *toVC = vcs[vcs.count - 2];
    [self _transitionViewControllerFrom:fromVC to:toVC animated:animated options:NSViewControllerTransitionSlideRight];
    [fromVC removeFromParentViewController];
    return fromVC;
}

- (void)_transitionViewControllerFrom:(nullable NSViewController *)fromVC to:(nullable NSViewController *)toVC animated:(BOOL)animated options:(NSViewControllerTransitionOptions)op {
    
    if (toVC) {
        toVC.view.frame = self.view.bounds;
        toVC.view.autoresizingMask = NSViewWidthSizable|NSViewHeightSizable;
    }
    NSAnimatablePropertyKey animationKey = @"subviews";
    CATransition *animation = [self.view.animator animationForKey:animationKey];
    if (!animation) {
        [self.view.animator setAnimations:@{ animationKey: self._viewReplaceAnimation }];
    }
    
    animation.duration = animated ? 0.3 : 0;
    if (op & NSViewControllerTransitionSlideLeft) {
        animation.subtype = kCATransitionFromRight;
    }
    else if (op & NSViewControllerTransitionSlideRight) {
        animation.subtype = kCATransitionFromLeft;
    }
    
    if (fromVC && toVC) {
        [self.view.animator replaceSubview:fromVC.view with:toVC.view];
    }
    else {
        if (fromVC) {
            [fromVC.view.animator removeFromSuperview];
        }
        else {
            [self.view.animator addSubview:toVC.view];
        }
    }
}

- (CATransition *)_viewReplaceAnimation {
    if (__viewReplaceAnimation) return __viewReplaceAnimation;
    CATransition *an = CATransition.animation;
    an.type = kCATransitionPush;
    an.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    __viewReplaceAnimation = an;
    return __viewReplaceAnimation;
}

- (NSViewController *)topViewController {
    return self.childViewControllers.lastObject;
}

- (NSArray<NSViewController *> *)viewControllers {
    return self.childViewControllers;
}

@end
