//
//  AZPMyBookMarkViewController.m
//  ShowQu
//
//  Created by Bx on 2019/5/30.
//  Copyright © 2019 bx. All rights reserved.
//

#import "AZPMyBookMarkViewController.h"

@interface AZPMyBookMarkViewController ()

@end

@implementation AZPMyBookMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"====");
    // Do any additional setup after loading the view.
}
- (void)loadDataWithUser:(User *)user{
    [super loadDataWithUser:user];
    NSLog(@"User = %@",user);
    
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
