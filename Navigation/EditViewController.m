//
//  EditViewController.m
//  Navigation
//
//  Created by André Helaehil on 15/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, 150, 100)];
    self.view.backgroundColor = [UIColor whiteColor];
    //label.text = _sing.palavras
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}
*/

@end