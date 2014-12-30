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

@end

// vim:ft=objc
