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

    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    
    _sing = [DicionarioSingleton instance];
    
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(90, 340, 150, 165)];
    _img.image = [_sing.imagens objectAtIndex:_sing.letra];
    
    [self.view addSubview:_img];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 30, 120, 80)];
    _textField.placeholder = [_sing.palavras objectAtIndex:_sing.letra];
    _textField.adjustsFontSizeToFitWidth = YES;
    _textField.delegate = self;
    [_textField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_textField];
    
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 90, 320, 200)];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    [_datePicker addTarget:self action:@selector(dateChange:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_datePicker];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    _labelDate = [[UILabel alloc] initWithFrame:CGRectMake(110, 280, 150, 80)];
    [self.view addSubview:_labelDate];
    _labelDate.text = [dateFormatter stringFromDate:_datePicker.date];

    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, 320, 44)];
    UIBarButtonItem *botaoFoto = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(tirarFoto:)];
    UIBarButtonItem *botaoDone =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    UIBarButtonItem *espaco =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //Cores dos botões da toolbar
    botaoDone.tintColor = [UIColor redColor];
    botaoFoto.tintColor = [UIColor redColor];
    
    
    _toolbar.items = [NSArray arrayWithObjects:botaoFoto, espaco, botaoDone, nil];
    _toolbar.tintColor = [UIColor blueColor];
    _toolbar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_toolbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}


- (void) done: (id) sender{
    [_sing.palavras replaceObjectAtIndex:_sing.letra withObject:_textField.text];
    [_sing.imagens replaceObjectAtIndex:_sing.letra withObject:_img.image];
    [_sing.datas replaceObjectAtIndex:_sing.letra withObject:_labelDate.text];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void) dateChange: (id)sender{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateStyle:NSDateFormatterMediumStyle];
    _labelDate.text=[format stringFromDate:_datePicker.date];
}

- (void) tirarFoto: (id) sender{
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:_imagePicker animated:YES completion:nil];
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    _img.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
