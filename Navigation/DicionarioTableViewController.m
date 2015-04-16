//
//  DicionarioTableViewController.m
//  Navigation
//
//  Created by André Helaehil on 14/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioTableViewController.h"

@interface DicionarioTableViewController ()

@end

@implementation DicionarioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    _sing = [DicionarioSingleton instance];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.allowsSelection = NO;
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 124, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    self.tabBarController.tabBar.tintColor = [UIColor blueColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _sing.palavras.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"celula";
    [self.tableView setSeparatorColor:[UIColor redColor]];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [_cell setPreservesSuperviewLayoutMargins:NO];
    [_cell setLayoutMargins:UIEdgeInsetsZero];
    
    _cell = [[UITableViewCell alloc]
            initWithStyle:UITableViewCellStyleDefault
            reuseIdentifier:identifier];
    _cell.backgroundView = [[UIView alloc] init];
    [_cell.backgroundView setBackgroundColor:[UIColor blackColor]];
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell.textLabel.text = _sing.palavras[indexPath.row];
    _cell.textLabel.textColor = [UIColor whiteColor];
    return _cell;

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


// Override to support rearranging the table view.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
//}
//
//
//
// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
