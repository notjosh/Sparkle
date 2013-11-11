//
//  SUAutomaticUpdateAndInstallDriver.m
//  Sparkle
//
//  Created by Joshua May on 11/11/2013.
//
//

#import "SUAutomaticUpdateAndInstallDriver.h"

@interface SUAutomaticUpdateAndInstallDriver ()

@property (assign) BOOL postponingInstallationInSubclass;

@end

@implementation SUAutomaticUpdateAndInstallDriver

@synthesize postponingInstallationInSubclass = _postponingInstallationInSubclass;

- (void)unarchiverDidFinish:(SUUnarchiver *)ua
{
    static BOOL InstallImmediately = YES;

    if (InstallImmediately) {
        [self installWithToolAndRelaunch:YES];
    } else {
        self.postponingInstallationInSubclass = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillTerminate:) name:NSApplicationWillTerminateNotification object:nil];
    }
}

- (BOOL)shouldInstallSynchronously { return self.postponingInstallationInSubclass; }

@end
