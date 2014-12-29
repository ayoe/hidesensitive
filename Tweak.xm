#import "Headers.h"

%hook SBAwayBulletinListItem

-(id)message {
    NSArray *blocked = @[@"com.google.inbox", @"com.facebook.Messenger", @"com.skype.skype", @"com.apple.MobileSMS", @"com.facebook.Facebook", @"com.apple.mobilesms.compose", @"com.apple.mobilesms.notification", @"net.whatsapp.WhatsApp", @"com.apple.mobilemail", @"com.timehop.ios.Timehop",@"com.facebook.Groups", @"com.apple.mobilephone", @"com.apple.MailCompositionService"];
    for (NSString *bundle in blocked) {
            if ([[[self activeBulletin] sectionID] isEqualToString:bundle]) {
                    return @"sensitive content hidden";
            }
    }
    return %orig;
}

%end