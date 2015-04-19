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

@interface EditViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) DicionarioSingleton *sing;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UILabel *labelDate;
@property (strong, nonatomic) UIToolbar *toolbar;
@property (strong, nonatomic) UIImageView *img;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end
