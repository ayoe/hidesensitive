#import "Headers.h"

%hook SBAwayBulletinListItem

-(id)message {
    NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.d4rkh0rse.hidesensitive.prefs.plist"]];
    if ([[prefs objectForKey:@"enabled"] boolValue] == YES) {
        if ([[prefs objectForKey:@"keywords"] boolValue] == NO) {
            NSArray *blocked = @[@"com.google.inbox", @"com.facebook.Messenger", @"com.skype.skype", @"com.apple.MobileSMS", @"com.facebook.Facebook", @"com.apple.mobilesms.compose", @"com.apple.mobilesms.notification", @"net.whatsapp.WhatsApp", @"com.apple.mobilemail", @"com.timehop.ios.Timehop",@"com.facebook.Groups", @"com.apple.mobilephone", @"com.apple.MailCompositionService", @"com.burbn.instagram", @"com.kik.chat", @"com.atebits.Tweetie2", @"com.google.Gmail", @"pinterest"];
            for (NSString *bundle in blocked) {
                    if ([[[self activeBulletin] sectionID] isEqualToString:bundle]) {
                            return @"sensitive content hidden";
                    }
            }
            return %orig;
        } else {
            NSArray *keyblocked = @[@"commented", @"liked", @"SSN", @"secur", @"retweet", @"poke", @"vilify", @"mail", @"meeting", @"$", @"dollar", @"money", @"bank", @"balance"];
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