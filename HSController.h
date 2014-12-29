//
//  HSController.h
//  
//
//  Created by Adithya Suresh on 12/28/14.
//
//

#import "Headers.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface HSController : NSObject

+(HSController *)sharedInstance;
-(id)init;
-(BOOL)handleBulletin:(SBAwayBulletinListItem *)item;

@end
