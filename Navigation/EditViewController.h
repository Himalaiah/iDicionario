//
//  EditViewController.h
//  Navigation
//
//  Created by André Helaehil on 15/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LetraViewController.h"
#import "DicionarioSingleton.h"

@interface EditViewController : UIViewController
@property (strong, nonatomic) DicionarioSingleton *sing;
@property (weak, nonatomic) UILabel *label;
@end
