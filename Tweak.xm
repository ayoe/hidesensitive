#import "Headers.h"

%hook SBAwayBulletinListItem

-(id)message {
    NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.d4rkh0rse.hidesensitive.prefs.plist"]];
    if ([[prefs objectForKey:@"enabled"] boolValue] == YES) {
        NSArray *blocked = @[@"com.google.inbox", @"com.facebook.Messenger", @"com.skype.skype", @"com.apple.MobileSMS", @"com.facebook.Facebook", @"com.apple.mobilesms.compose", @"com.apple.mobilesms.notification", @"net.whatsapp.WhatsApp", @"com.apple.mobilemail", @"com.timehop.ios.Timehop",@"com.facebook.Groups", @"com.apple.mobilephone", @"com.apple.MailCompositionService", @"com.burbn.instagram", @"com.kik.chat", @"com.atebits.Tweetie2", @"com.google.Gmail", @"pinterest"];
        for (NSString *bundle in blocked) {
                if ([[[self activeBulletin] sectionID] isEqualToString:bundle]) {
                        return @"sensitive content hidden";
                }
        }
        return %orig;
    } else {
        return %orig;
    }
}

%end