//
//  PhotoCollectionViewCell.m
//  PhotosAndFilters
//
//  Created by Dustin M on 10/21/15.
//  Copyright © 2015 Vento. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

#define IMAGEVIEW_BORDER_LENGTH 5

@implementation PhotoCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    [self.contentView addSubview:self.imageView];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}

@end
