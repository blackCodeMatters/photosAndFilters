//
//  AlbumTableViewController.m
//  PhotosAndFilters
//
//  Created by Dustin M on 10/27/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import "AlbumTableViewController.h"
#import "Album.h"
#import "PhotosViewCollectionViewController.h"

@interface AlbumTableViewController () <UIAlertViewDelegate>

@end

@implementation AlbumTableViewController

-(NSMutableArray *)albums
{
    //if album mutable array does not exist, create one
    if (!_albums) _albums = [[NSMutableArray alloc] init];
    return _albums;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender
{
    //UIAlertController *newAlbumAlertView = [UIAlertController alertControllerWithTitle:@"Enter new album name" message:nil preferredStyle:UIAlertViewStylePlainTextInput];
    UIAlertController *newAlbumAlertView = [UIAlertController alertControllerWithTitle:@"Enter new album name" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {[newAlbumAlertView dismissViewControllerAnimated: YES completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [newAlbumAlertView dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [newAlbumAlertView addAction:ok];
    [newAlbumAlertView addAction:cancel];
    
    [self presentViewController:newAlbumAlertView animated:YES completion:nil];
}

#pragma mark - Helper Methods

- (Album *)albumWithName:(NSString *)name
{
    id delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    //NSManagedObjectContext *context = [CoreDataHelper managedObjectContext];
    Album *album = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
    
    album.name = name;
    album.date = [NSDate date];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"%@", error);
    }
    
    return album;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1){
        NSString *alertText = [alertView.textFields objectAtIndex:0].text;
        [self.albums addObject:[self albumWithName:alertText]];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self.albums count] - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //returns number of elements in array, thus number of rows in table view
    return [self.albums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Album *selectedAlbum = self.albums[indexPath.row];
    cell.textLabel.text = selectedAlbum.name;
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Album Chosen"]){
        if ([segue.destinationViewController isKindOfClass:[PhotosViewCollectionViewController class]]){
            NSIndexPath *path = [self.tableView indexPathForSelectedRow];
            
            PhotosViewCollectionViewController *targetViewController = segue.destinationViewController;
            targetViewController.album = self.albums[path.row];
        }
    }
}











@end
