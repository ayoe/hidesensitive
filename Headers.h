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

@interface SBBBSectionInfo

@property(readonly, nonatomic) NSString *listSectionIdentifier;

@end

@interface SBNotificationCenterSectionInfo : SBBBSectionInfo

@end

@interface SBNotificationsBulletinInfo

@property(retain, nonatomic) SBNotificationCenterSectionInfo *sectionInfo;
-(id)_secondaryText;

@end



@interface BBBulletin

+(id)copyCachedBulletinWithBulletinID:(id)arg1;
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

@interface SBLockScreenManager

-(_Bool)attemptUnlockWithPasscode:(id)arg1;
-(void)_bioAuthenticated:(id)arg1;

@end