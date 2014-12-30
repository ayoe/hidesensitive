#import "Headers.h"

NSDictionary *prefs;

BOOL deviceIsLocked = YES;

%hook SBAwayBulletinListItem

-(id)message {
    NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.d4rkh0rse.hidesensitive.prefs.plist"]];
    if ([[prefs objectForKey:@"enabled"] boolValue] == YES) {
        if ([[prefs objectForKey:@"keywords"] boolValue] == NO) {
            NSString *keyID = [@"HideSensitive-" stringByAppendingString:[[self activeBulletin] sectionID]];
            if ([[prefs objectForKey:keyID] boolValue] == YES) {
                return @"sensitive content hidden";
            }
            return %orig;
        } else {
            NSString *keyWords = [prefs objectForKey:@"usrwords"];
            NSArray *keyblocked = [keyWords componentsSeparatedByString:@", "];
            NSString *origs = %orig;
            for (NSString *key in keyblocked) {
                if ([origs containsString:key]) {
                    return @"sensitive content hidden";
                }
            }
            return %orig;
        }
    } else {
        return %orig;
    }
}

%end

%hook SBNotificationsBulletinInfo

%new
-(NSString *)sectionID {
    return [[self sectionInfo] listSectionIdentifier];
}

-(id)_secondaryText {
    if (deviceIsLocked == YES && [[prefs objectForKey:@"nc"] boolValue] == YES) {
        if ([[prefs objectForKey:@"enabled"] boolValue] == YES) {
            if ([[prefs objectForKey:@"keywords"] boolValue] == NO) {
                NSString *keyID = [@"HideSensitive-" stringByAppendingString:[self sectionID]];
                if ([[prefs objectForKey:keyID] boolValue] == YES) {
                    return @"sensitive content hidden";
                }
            } else {
                NSString *keyWords = [prefs objectForKey:@"usrwords"];
                NSArray *keyblocked = [keyWords componentsSeparatedByString:@", "];
                NSString *origs = %orig;
                for (NSString *key in keyblocked) {
                    if ([origs containsString:key]) {
                        return @"sensitive content hidden";
                    }
                }
            }
            return %orig;
        } else {
            return %orig;
        }
    } else {
        %orig;
    }
}

%end

%hook SBLockScreenManager

-(void)_setUILocked:(_Bool)arg1 {
    if (arg1 == YES) {
        deviceIsLocked = YES;
    } else {
        deviceIsLocked = NO;
    }
    %orig;
}

-(void)_bioAuthenticated:(id)arg1 {
    if ([arg1 boolValue] == YES) {
        deviceIsLocked = NO;
    } else {
        deviceIsLocked = YES;
    }
    %orig;
}

%end

static void loadPrefs() {
    prefs = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.d4rkh0rse.hidesensitive.prefs.plist"]];
}

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.d4rkh0rse.hidesensitive/changePrefs"), NULL, 0);
}