//
//  DicionarioTableViewController.h
//  Navigation
//
//  Created by André Helaehil on 14/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicionarioSingleton.h"

@interface DicionarioTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DicionarioSingleton *sing;
@property (nonatomic, strong) UITableViewCell *cell;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UITableView *tableView;

@end
