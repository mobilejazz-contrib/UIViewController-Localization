//
//  UIViewController+Localization.m
//
//  Created by jchavarri on 20/08/13.
//  Copyright (c) 2013 MobileJazz. All rights reserved.
//

#import <objc/runtime.h>
#import "UIViewController+Localization.h"

@implementation UIViewController (Localization)

- (void)swizzled_viewDidLoad
{
    [self swizzled_viewDidLoad];
    
    //Localize every subview
    [self localizeSubviewsOfView:self.view];
    
}

-(void) localizeView:(UIView *)view
{
    if( [view isKindOfClass:[UIButton class]] )
    {
        UIButton *btn = (UIButton *)view;
        [btn setTitle:NSLocalizedString(btn.titleLabel.text, @"") forState:UIControlStateNormal];
    }
    else if( [view isKindOfClass:[UILabel class]] )
    {
        UILabel *lbl = (UILabel *)view;
        [lbl setText:NSLocalizedString(lbl.text, @"")];
    }
    else if( [view isKindOfClass:[UITextField class]] )
    {
        UITextField *txt = (UITextField *)view;
        [txt setPlaceholder:NSLocalizedString(txt.placeholder, @"")];
    }
    else
    {
        //Deal with other UIKit classes
    }
}

- (void)localizeSubviewsOfView:(UIView *)view
{
    [self localizeView:view];
    
    // Get the subviews of the view
    NSArray *subviews = [view subviews];
    
    // Return if there are no subviews
    if ([subviews count] == 0) return;
    
    for (UIView *subview in subviews) {
        
        // Localize subviews
        [self localizeSubviewsOfView:subview];
    }
}

+ (void)load
{
    // The "+ load" method is called once, very early in the application life-cycle.
    // It's called even before the "main" function is called. Beware: there's no
    // autorelease pool at this point, so avoid Objective-C calls.
    Method original, swizzle;
    
    // Get the "- (id)viewDidLoad:" method.
    original = class_getInstanceMethod(self, @selector(viewDidLoad));
    // Get the "- (id)swizzled_viewDidLoad:" method.
    swizzle = class_getInstanceMethod(self, @selector(swizzled_viewDidLoad));
    // Swap their implementations.
    method_exchangeImplementations(original, swizzle);
    
}
@end
