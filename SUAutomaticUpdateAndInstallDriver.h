//
//  SUAutomaticUpdateAndInstallDriver.h
//  Sparkle
//
//  Created by Joshua May on 11/11/2013.
//
//

#import "SUAutomaticUpdateDriver.h"

@interface SUAutomaticUpdateAndInstallDriver : SUAutomaticUpdateDriver {
@private
    BOOL _postponingInstallationInSubclass;
}

@end
