//
//  BookDetail.m
//  searchbook
//
//  Created by 栾有数 on 15/9/16.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import "BookDetail.h"

@interface BookDetail ()

@end

@implementation BookDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bookContent.text = self.content;
}
- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
