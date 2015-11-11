//
//  CoreDataHelper.m
//  PhotosAndFilters
//
//  Created by Dustin M on 10/20/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

+(NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
