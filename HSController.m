//
//  HSController.m
//  
//
//  Created by Adithya Suresh on 12/28/14.
//
//

#import "HSController.h"

@implementation HSController

+ (HSController *)sharedInstance {
    static dispatch_once_t once = 0;
    __strong static id _sharedInstance = nil;
    dispatch_once(&once, ^{
        _sharedInstance = [[HSController alloc] init];
    });
    return _sharedInstance;
}

-(BOOL)handleBulletin:(SBAwayBulletinListItem *)item {
    if ([[[item activeBulletin] sectionID] isEqualToString:@"com.google.inbox"]) {
        return YES;
    } else {
        return NO;
    }
}

@end