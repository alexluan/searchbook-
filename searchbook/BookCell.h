//
//  BookCell.h
//  searchbook
//
//  Created by 栾有数 on 15/9/16.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"
@interface BookCell : UITableViewCell
-(void)loadBookData:(BookModel *)model;
-(BookModel *)getBookDeatil;
@end
