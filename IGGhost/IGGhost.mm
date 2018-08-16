#line 1 "/Users/mac/Desktop/IGGhost/IGGhost/IGGhost.xm"
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import <Social/Social.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "NoAdsINstagram.h"
#import "FRPrefs.h"
#import "SCLAlertView.h"

#define IGGHostColor [UIColor colorWithRed:209/255.0f green:59/255.0f blue:87/255.0f alpha:1.0f]




@interface IGProfileViewController : UIViewController
- (void)isTapped:(id)sender;
@end

@interface IGProfileViewController (IGGhost)
- (void)isTapped:(id)sender;
@end





#include <objc/message.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

__attribute__((unused)) static void _logos_register_hook$(Class _class, SEL _cmd, IMP _new, IMP *_old) {
unsigned int _count, _i;
Class _searchedClass = _class;
Method *_methods;
while (_searchedClass) {
_methods = class_copyMethodList(_searchedClass, &_count);
for (_i = 0; _i < _count; _i++) {
if (method_getName(_methods[_i]) == _cmd) {
if (_class == _searchedClass) {
*_old = method_getImplementation(_methods[_i]);
*_old = method_setImplementation(_methods[_i], _new);
} else {
class_addMethod(_class, _cmd, _new, method_getTypeEncoding(_methods[_i]));
}
free(_methods);
return;
}
}
free(_methods);
_searchedClass = class_getSuperclass(_searchedClass);
}
}
@class IGPost; @class IGMainFeedListAdapterDataSource; @class IGProfileViewController; @class AppDelegate; 
static Class _logos_superclass$_ungrouped$IGProfileViewController; static void (*_logos_orig$_ungrouped$IGProfileViewController$_openAccountSettings)(_LOGOS_SELF_TYPE_NORMAL IGProfileViewController* _LOGOS_SELF_CONST, SEL);static Class _logos_superclass$_ungrouped$AppDelegate; static void (*_logos_orig$_ungrouped$AppDelegate$applicationDidBecomeActive$)(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, id);static Class _logos_superclass$_ungrouped$IGPost; static id (*_logos_orig$_ungrouped$IGPost$mediaCoord)(_LOGOS_SELF_TYPE_NORMAL IGPost* _LOGOS_SELF_CONST, SEL);static void (*_logos_orig$_ungrouped$IGPost$setMediaCoord$)(_LOGOS_SELF_TYPE_NORMAL IGPost* _LOGOS_SELF_CONST, SEL, id);static Class _logos_superclass$_ungrouped$IGMainFeedListAdapterDataSource; static NSArray * (*_logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$)(_LOGOS_SELF_TYPE_NORMAL IGMainFeedListAdapterDataSource* _LOGOS_SELF_CONST, SEL, IGListAdapter *);

#line 28 "/Users/mac/Desktop/IGGhost/IGGhost/IGGhost.xm"

static void _logos_method$_ungrouped$IGProfileViewController$_openAccountSettings(_LOGOS_SELF_TYPE_NORMAL IGProfileViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    
    SCLAlertView *Settings = [[SCLAlertView alloc] initWithNewWindow];
    Settings.backgroundType = SCLAlertViewBackgroundBlur;
    Settings.customViewColor = [UIColor colorWithRed:42/255.0f green:138/255.0f blue:227/225.0f alpha:1.0f];
    [Settings addButton:@"Instagram Settings" actionBlock:^{
        (_logos_orig$_ungrouped$IGProfileViewController$_openAccountSettings ? _logos_orig$_ungrouped$IGProfileViewController$_openAccountSettings : (__typeof__(_logos_orig$_ungrouped$IGProfileViewController$_openAccountSettings))class_getMethodImplementation(_logos_superclass$_ungrouped$IGProfileViewController, @selector(_openAccountSettings)))(self, _cmd);
    }];
    
    [Settings addButton:@"IGGhost Settings" target:self selector:@selector(isTapped:)];
    
    [Settings showQuestion:nil subTitle:@"Settings" closeButtonTitle:@"Cancel" duration:0.0f];
    
    
    
}

static void _logos_method$_ungrouped$IGProfileViewController$isTapped$(_LOGOS_SELF_TYPE_NORMAL IGProfileViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id sender) {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    FRPSection *IGGSection1 = [FRPSection sectionWithTitle:@"IGGhost Preferences" footer:nil];
    
    
    FRPSwitchCell *IGGSwitch1 = [FRPSwitchCell cellWithTitle:@"Ghost Mode" setting:[FRPSettings settingsWithKey:@"IGGSWitch1" defaultValue:@NO] postNotification:nil changeBlock:^(UISwitch *sender) {
        if ([sender isOn]) {
            SCLAlertView *SCalert = [[SCLAlertView alloc] initWithNewWindow];
            SCalert.backgroundType = SCLAlertViewBackgroundBlur;
            [SCalert showNotice:@"IGGhost" subTitle:@"You need Relaunch instagram to apply changes" closeButtonTitle:@"OK" duration:0.0f];
        } else {
            SCLAlertView *SCalert = [[SCLAlertView alloc] initWithNewWindow];
            SCalert.backgroundType = SCLAlertViewBackgroundBlur;
            [SCalert showNotice:@"IGGhost" subTitle:@"You need Relaunch instagram to apply changes" closeButtonTitle:@"OK" duration:0.0f];
        }
    }];
    
    FRPSwitchCell *ADSSwitch = [FRPSwitchCell cellWithTitle:@"Disable ADs" setting:[FRPSettings settingsWithKey:@"ADsSWitch" defaultValue:@NO] postNotification:nil changeBlock:^(UISwitch *sender) {
        if ([sender isOn]) {
            SCLAlertView *SCalert = [[SCLAlertView alloc] initWithNewWindow];
            SCalert.backgroundType = SCLAlertViewBackgroundBlur;
            [SCalert showNotice:@"IGGhost" subTitle:@"You need Relaunch instagram to apply changes" closeButtonTitle:@"OK" duration:0.0f];
        } else {
            SCLAlertView *SCalert = [[SCLAlertView alloc] initWithNewWindow];
            SCalert.backgroundType = SCLAlertViewBackgroundBlur;
            [SCalert showNotice:@"IGGhost" subTitle:@"You need Relaunch instagram to apply changes" closeButtonTitle:@"OK" duration:0.0f];
        }
    }];
    
    [IGGSwitch1.switchView setOnTintColor:IGGHostColor];
    
    [IGGSection1 addCell:IGGSwitch1];
    [IGGSection1 addCell:ADSSwitch];
    
    
    FRPSection *IGGDEVSection = [FRPSection sectionWithTitle:@"Developer" footer:nil];
    
    FRPDeveloperCell *IGGDeveloper = [FRPDeveloperCell cellWithTitle:@"BandarHelal" detail:@"BandarHL" image:[UIImage imageNamed:@"/Library/Application Support/IGGhost/IGGhost.bundle/bandarHL.png"] url:@"https://twitter.com/BandarHL"];
    [IGGDEVSection addCell:IGGDeveloper];
    
    
    FRPDeveloperCell *paypal = [FRPDeveloperCell cellWithTitle:@"Donate via paypal" detail:@"PayPal" image:[UIImage imageNamed:@"/Library/Application Support/IGGhost/IGGhost.bundle/PrefsDonate.png"] url:@"https://www.paypal.me/fjr699"];
    [IGGDEVSection addCell:paypal];
    
    
    
    
    FRPreferences *table = [FRPreferences tableWithSections:@[IGGSection1,IGGDEVSection] title:@"IGGhost" tintColor:IGGHostColor];
    
    UIBarButtonItem *IGHeart = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"/Library/Application Support/IGGhost/IGGhost.bundle/heart.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    table.navigationItem.rightBarButtonItem = IGHeart;
    
    [self.navigationController pushViewController:table animated:YES];
    
    
}

static void _logos_method$_ungrouped$IGProfileViewController$shareTapped$(_LOGOS_SELF_TYPE_NORMAL IGProfileViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id sender) {
    TWTweetComposeViewController *tw = [[TWTweetComposeViewController alloc] init];
    [tw setInitialText:@"I'm using #IGGhost By @BandarHL"];
    
    [self presentViewController:tw animated:YES completion:nil];
}










static void _logos_method$_ungrouped$AppDelegate$applicationDidBecomeActive$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    (_logos_orig$_ungrouped$AppDelegate$applicationDidBecomeActive$ ? _logos_orig$_ungrouped$AppDelegate$applicationDidBecomeActive$ : (__typeof__(_logos_orig$_ungrouped$AppDelegate$applicationDidBecomeActive$))class_getMethodImplementation(_logos_superclass$_ungrouped$AppDelegate, @selector(applicationDidBecomeActive:)))(self, _cmd, arg1);
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"FirstRun"]) {
        
        
        
        SCLAlertView *SCalert = [[SCLAlertView alloc] initWithNewWindow];
        
        SCalert.backgroundType = SCLAlertViewBackgroundBlur;
        [SCalert showNotice:@"IGGhost" subTitle:@"Thank you for Downloading IGGhost" closeButtonTitle:@"OK" duration:0.0f];
        
        
        
        
        
        [[NSUserDefaults standardUserDefaults] setValue:@"1strun" forKey:@"FirstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}













static id _logos_method$_ungrouped$IGPost$mediaCoord(_LOGOS_SELF_TYPE_NORMAL IGPost* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"IGGSWitch1"]) {
        return NULL;
    } else {
        return (_logos_orig$_ungrouped$IGPost$mediaCoord ? _logos_orig$_ungrouped$IGPost$mediaCoord : (__typeof__(_logos_orig$_ungrouped$IGPost$mediaCoord))class_getMethodImplementation(_logos_superclass$_ungrouped$IGPost, @selector(mediaCoord)))(self, _cmd);
    }
}

static void _logos_method$_ungrouped$IGPost$setMediaCoord$(_LOGOS_SELF_TYPE_NORMAL IGPost* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"IGGSWitch1"]) {
        arg1 = NULL;
    } else {
        return (_logos_orig$_ungrouped$IGPost$setMediaCoord$ ? _logos_orig$_ungrouped$IGPost$setMediaCoord$ : (__typeof__(_logos_orig$_ungrouped$IGPost$setMediaCoord$))class_getMethodImplementation(_logos_superclass$_ungrouped$IGPost, @selector(setMediaCoord:)))(self, _cmd, arg1);
    }
}





static NSArray * _logos_method$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$(_LOGOS_SELF_TYPE_NORMAL IGMainFeedListAdapterDataSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, IGListAdapter * arg1) {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"ADsSWitch"]) {
        
        NSArray *objects = (_logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$ ? _logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$ : (__typeof__(_logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$))class_getMethodImplementation(_logos_superclass$_ungrouped$IGMainFeedListAdapterDataSource, @selector(objectsForListAdapter:)))(self, _cmd, arg1);
        NSMutableArray *objectsWithoutAds = [@[] mutableCopy];
        for (id object in objects)
            if (![object isKindOfClass:(NSClassFromString(@"IGFeedItem"))] || ([object isKindOfClass:(NSClassFromString(@"IGFeedItem"))] && !(((IGFeedItem *)object).isSponsored || ((IGFeedItem *)object).isSponsoredApp)))
                [objectsWithoutAds addObject:object];
        return objectsWithoutAds;
        
        
    } else {
        return (_logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$ ? _logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$ : (__typeof__(_logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$))class_getMethodImplementation(_logos_superclass$_ungrouped$IGMainFeedListAdapterDataSource, @selector(objectsForListAdapter:)))(self, _cmd, arg1);
    }
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$IGProfileViewController = objc_getClass("IGProfileViewController"); _logos_superclass$_ungrouped$IGProfileViewController = class_getSuperclass(_logos_class$_ungrouped$IGProfileViewController); { _logos_register_hook$(_logos_class$_ungrouped$IGProfileViewController, @selector(_openAccountSettings), (IMP)&_logos_method$_ungrouped$IGProfileViewController$_openAccountSettings, (IMP *)&_logos_orig$_ungrouped$IGProfileViewController$_openAccountSettings);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$IGProfileViewController, @selector(isTapped:), (IMP)&_logos_method$_ungrouped$IGProfileViewController$isTapped$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$IGProfileViewController, @selector(shareTapped:), (IMP)&_logos_method$_ungrouped$IGProfileViewController$shareTapped$, _typeEncoding); }Class _logos_class$_ungrouped$AppDelegate = objc_getClass("AppDelegate"); _logos_superclass$_ungrouped$AppDelegate = class_getSuperclass(_logos_class$_ungrouped$AppDelegate); { _logos_register_hook$(_logos_class$_ungrouped$AppDelegate, @selector(applicationDidBecomeActive:), (IMP)&_logos_method$_ungrouped$AppDelegate$applicationDidBecomeActive$, (IMP *)&_logos_orig$_ungrouped$AppDelegate$applicationDidBecomeActive$);}Class _logos_class$_ungrouped$IGPost = objc_getClass("IGPost"); _logos_superclass$_ungrouped$IGPost = class_getSuperclass(_logos_class$_ungrouped$IGPost); { _logos_register_hook$(_logos_class$_ungrouped$IGPost, @selector(mediaCoord), (IMP)&_logos_method$_ungrouped$IGPost$mediaCoord, (IMP *)&_logos_orig$_ungrouped$IGPost$mediaCoord);}{ _logos_register_hook$(_logos_class$_ungrouped$IGPost, @selector(setMediaCoord:), (IMP)&_logos_method$_ungrouped$IGPost$setMediaCoord$, (IMP *)&_logos_orig$_ungrouped$IGPost$setMediaCoord$);}Class _logos_class$_ungrouped$IGMainFeedListAdapterDataSource = objc_getClass("IGMainFeedListAdapterDataSource"); _logos_superclass$_ungrouped$IGMainFeedListAdapterDataSource = class_getSuperclass(_logos_class$_ungrouped$IGMainFeedListAdapterDataSource); { _logos_register_hook$(_logos_class$_ungrouped$IGMainFeedListAdapterDataSource, @selector(objectsForListAdapter:), (IMP)&_logos_method$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$, (IMP *)&_logos_orig$_ungrouped$IGMainFeedListAdapterDataSource$objectsForListAdapter$);}} }
#line 213 "/Users/mac/Desktop/IGGhost/IGGhost/IGGhost.xm"
