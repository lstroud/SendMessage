//
//  CCAppDelegate.m
//  sendmessage
//
//  Created by Les Stroud on 1/25/13.
//  Copyright (c) 2013 Crafted Code. All rights reserved.
//

#import "CCAppDelegate.h"
#import <AppKit/AppKit.h>

@implementation CCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   NSArray *shareItems = [[NSMutableArray alloc] initWithCapacity:0];
   NSSharingService *service = [NSSharingService sharingServiceNamed:NSSharingServiceNameComposeMessage];
   service.delegate = self;
   [service performWithItems:shareItems];
}

//- (NSWindow *)sharingService:(NSSharingService *)sharingService
//   sourceWindowForShareItems:(NSArray *)items
//         sharingContentScope:(NSSharingContentScope *)sharingContentScope
//{
//   *sharingContentScope = NSSharingContentScopeItem;
//   return safariWindow;
//}

- (void)sharingService:(NSSharingService *)sharingService didShareItems:(NSArray *)items{
   [NSApp terminate:nil];
}

- (void)sharingService:(NSSharingService *)sharingService didFailToShareItems:(NSArray *)items error:(NSError *)error{
   NSLog(@"Error: %@", error.localizedDescription);
   [NSApp terminate:nil];
}

@end
