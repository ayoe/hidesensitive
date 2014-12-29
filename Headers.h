//
//  Headers.h
//  
//
//  Created by Adithya Suresh on 12/28/14.
//
//

#ifndef _Headers_h
#define _Headers_h


#endif

@interface BBBulletin

@property(copy, nonatomic) NSString *sectionID;
@property(copy, nonatomic) NSString *message;

@end

@interface SBAwayBulletinListItem

@property(retain) BBBulletin *activeBulletin;
-(id)message;

@end

@interface SBLockScreenNotificationListController

-(void)_updateModelAndViewForAdditionOfItem:(id)arg1;

@end