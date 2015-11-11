//
//  AlbumTableViewController.h
//  PhotosAndFilters
//
//  Created by Dustin M on 10/27/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewController : UITableViewController 

@property (strong, nonatomic) NSMutableArray *albums;

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
