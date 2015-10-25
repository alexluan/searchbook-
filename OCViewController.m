//
//  OCViewController.m
//  searchbook
//
//  Created by 栾有数 on 15/9/25.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@end

@implementation OCViewController
- (IBAction)POP:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
