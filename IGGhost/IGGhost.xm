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

%config(generator=internal)


@interface IGProfileViewController : UIViewController
- (void)isTapped:(id)sender;
@end

@interface IGProfileViewController (IGGhost)
- (void)isTapped:(id)sender;
@end




%hook IGProfileViewController
- (void)_openAccountSettings {
    
    
    SCLAlertView *Settings = [[SCLAlertView alloc] initWithNewWindow];
    Settings.backgroundType = SCLAlertViewBackgroundBlur;
    Settings.customViewColor = [UIColor colorWithRed:42/255.0f green:138/255.0f blue:227/225.0f alpha:1.0f];
    [Settings addButton:@"Instagram Settings" actionBlock:^{
        %orig;
    }];
    
    [Settings addButton:@"IGGhost Settings" target:self selector:@selector(isTapped:)];
    
    [Settings showQuestion:nil subTitle:@"Settings" closeButtonTitle:@"Cancel" duration:0.0f];
    
    
    
}
%new
- (void)isTapped:(id)sender {
    //    FRPViewSection *IGGhostSection = [FRPViewSection sectionWithHeight:70 initBlock:^(UITableViewCell *cell) {
    //        cell.backgroundColor = [UIColor clearColor];
    //
    //        UILabel *IGGLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //        IGGLabel.font = [UIFont fontWithName:@"arial" size:55];
    //        [IGGLabel setText:@"IGGhost"];
    //        [IGGLabel setTextColor:[UIColor colorWithRed:209/255.0f green:59/255.0f blue:87/255.0f alpha:1.0f]];
    //        [IGGLabel setTextAlignment:NSTextAlignmentCenter];
    //        [IGGLabel setTag:9];
    //
    //
    //        [cell.contentView addSubview:IGGLabel];
    //    } layoutBlock:^(UITableViewCell *cell) {
    //        [[cell.contentView viewWithTag:9] setFrame:CGRectMake(0, -5, cell.frame.size.width, 60)];
    //    }];
    //
    
    
    
    FRPSection *IGGSection1 = [FRPSection sectionWithTitle:@"IGGhost Preferences" footer:nil];
    
    ///// GHost Mode /////
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
    
    /////////////// DEVE //////////////////
    FRPSection *IGGDEVSection = [FRPSection sectionWithTitle:@"Developer" footer:nil];
    
    FRPDeveloperCell *IGGDeveloper = [FRPDeveloperCell cellWithTitle:@"BandarHelal" detail:@"BandarHL" image:[UIImage imageNamed:@"/Library/Application Support/IGGhost/IGGhost.bundle/bandarHL.png"] url:@"https://twitter.com/BandarHL"];
    [IGGDEVSection addCell:IGGDeveloper];
    
    /// // /// //
    FRPDeveloperCell *paypal = [FRPDeveloperCell cellWithTitle:@"Donate via paypal" detail:@"PayPal" image:[UIImage imageNamed:@"/Library/Application Support/IGGhost/IGGhost.bundle/PrefsDonate.png"] url:@"https://www.paypal.me/fjr699"];
    [IGGDEVSection addCell:paypal];
    
    
    ///////////// Table /////////////////
    
    FRPreferences *table = [FRPreferences tableWithSections:@[IGGSection1,IGGDEVSection] title:@"IGGhost" tintColor:IGGHostColor];
    
    UIBarButtonItem *IGHeart = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"/Library/Application Support/IGGhost/IGGhost.bundle/heart.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    table.navigationItem.rightBarButtonItem = IGHeart;
    
    [self.navigationController pushViewController:table animated:YES];
    
    //table.navigationController.navigationBar.tintColor = IGGHostColor;
}
%new
- (void)shareTapped:(id)sender {
    TWTweetComposeViewController *tw = [[TWTweetComposeViewController alloc] init];
    [tw setInitialText:@"I'm using #IGGhost By @BandarHL"];
    
    [self presentViewController:tw animated:YES completion:nil];
}

%end





//instagram
%hook AppDelegate

- (void)applicationDidBecomeActive:(id)arg1 {
    
    %orig;
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"FirstRun"]) {
        
        // Your Code //
        
        SCLAlertView *SCalert = [[SCLAlertView alloc] initWithNewWindow];
        //SCalert.customViewColor = [UIColor colorWithRed:42/255.0f green:138/255.0f blue:227/255.0f alpha:1.0f];
        SCalert.backgroundType = SCLAlertViewBackgroundBlur;
        [SCalert showNotice:@"IGGhost" subTitle:@"Thank you for Downloading IGGhost" closeButtonTitle:@"OK" duration:0.0f];
        
        
        
        
        
        [[NSUserDefaults standardUserDefaults] setValue:@"1strun" forKey:@"FirstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

%end








///////// Tweak /////////////////
%hook IGPost

- (id)mediaCoord {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"IGGSWitch1"]) {
        return NULL;
    } else {
        return %orig;
    }
}

- (void)setMediaCoord:(id)arg1 {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"IGGSWitch1"]) {
        arg1 = NULL;
    } else {
        return %orig;
    }
}
%end

// No ADS
%hook IGMainFeedListAdapterDataSource

- (NSArray *)objectsForListAdapter:(IGListAdapter *)arg1 {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"ADsSWitch"]) {
        
        NSArray *objects = %orig;
        NSMutableArray *objectsWithoutAds = [@[] mutableCopy];
        for (id object in objects)
            if (![object isKindOfClass:(NSClassFromString(@"IGFeedItem"))] || ([object isKindOfClass:(NSClassFromString(@"IGFeedItem"))] && !(((IGFeedItem *)object).isSponsored || ((IGFeedItem *)object).isSponsoredApp)))
                [objectsWithoutAds addObject:object];
        return objectsWithoutAds;
        
        
    } else {
        return %orig;
    }
}
%end
