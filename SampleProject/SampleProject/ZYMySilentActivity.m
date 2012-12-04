//
//  ZYMySilentActivity.m
//  SampleProject
//
//  Created by Mariano Abdala on 12/3/12.
//  Copyright (c) 2012 zerously. All rights reserved.
//

#import "ZYMySilentActivity.h"

@implementation ZYMySilentActivity

#pragma mark - Hierarchy
#pragma mark UIActivity
- (NSString *)activityTitle {
    
    return NSLocalizedString(@"My silent activity", @"");
}

- (UIImage *)activityImage {
    
    UIImage *activityImage =
    UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ?
    [UIImage imageNamed:@"instapaper"] :
    [UIImage imageNamed:@"instapaper-ipad"];
    
    return activityImage;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    return YES;
}

#pragma mark ZYActivity
- (UIViewController *)performWithActivityItems:(NSArray *)activityItems {
    
    NSOperationQueue *backgroundQueue =
    [[NSOperationQueue alloc] init];
    
    [backgroundQueue addOperationWithBlock:^{
        
        NSLog(@"My activity has begun!", nil);
        
        sleep(5);
        
        NSLog(@"My activity has finished!", nil);
        
        [self activityDidFinish:YES];
    }];
    
    return nil;
}

@end