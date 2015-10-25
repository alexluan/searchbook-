//
//  BookCell.m
//  searchbook
//
//  Created by 栾有数 on 15/9/16.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import "BookCell.h"
@interface BookCell()
@property (strong, nonatomic) IBOutlet UIImageView *imageHeader;
@property (strong, nonatomic) IBOutlet UILabel *bookName;
@property (strong,nonatomic) BookModel * model;
@end
@implementation BookCell
-(BookModel *)getBookDeatil{
    return self.model;
}
-(void)loadBookData:(BookModel *)model{
    self.model = [[BookModel alloc] init];
    self.model = model;
    self.imageHeader.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]]];
    self.bookName.text = model.title;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setFrame:(CGRect)frame{
    frame.size.height -=5;
    [super setFrame:frame];
}
@end
