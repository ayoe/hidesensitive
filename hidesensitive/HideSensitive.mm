#import <Preferences/Preferences.h>

@interface HideSensitiveListController: PSListController {
}
@end

@implementation HideSensitiveListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"HideSensitive" target:self] retain];
	}
	return _specifiers;
}

-(void)respring {
    system("killall -9 SpringBoard");
}
@end

// vim:ft=objc
