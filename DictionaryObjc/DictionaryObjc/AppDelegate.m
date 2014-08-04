//
//  AppDelegate.m
//  DictionaryObjc
//
//  Created by Markus Persson on 25/07/14.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end


@implementation AppDelegate
            

- (NSDictionary *)jsonResponse
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}


- (void)parseResponse
{
    NSDictionary *json = [self jsonResponse];
    NSLog(@"JSON: %@", json);
    
    NSArray *employees = json[@"employees"];
    
    for (NSDictionary *employee in employees)
    {
        NSString *firstName = employee[@"firstName"];
        NSString *lastName = employee[@"lastName"];
        
        NSLog(@"employee: %@ %@", firstName, lastName);
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self parseResponse];
    
    return YES;
}


@end
