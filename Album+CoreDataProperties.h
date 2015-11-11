//
//  Album+CoreDataProperties.h
//  PhotosAndFilters
//
//  Created by Dustin M on 11/6/15.
//  Copyright © 2015 Vento. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Album.h"

NS_ASSUME_NONNULL_BEGIN

@interface Album (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *photos;

@end

@interface Album (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(NSManagedObject *)value;
- (void)removePhotosObject:(NSManagedObject *)value;
- (void)addPhotos:(NSSet<NSManagedObject *> *)values;
- (void)removePhotos:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
