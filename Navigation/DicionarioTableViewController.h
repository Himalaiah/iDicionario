//
//  DicionarioTableViewController.h
//  Navigation
//
//  Created by André Helaehil on 14/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicionarioSingleton.h"

@interface DicionarioTableViewController : UITableViewController

@property (nonatomic, strong) DicionarioSingleton *sing;
@property (nonatomic, strong) UITableViewCell *cell;
@end
