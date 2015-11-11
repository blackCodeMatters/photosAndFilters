//
//  PhotosViewCollectionViewController.h
//  PhotosAndFilters
//
//  Created by Dustin M on 10/20/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface PhotosViewCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Album *album;

- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
