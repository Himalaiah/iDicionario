//
//  LetraViewController.m
//  Navigation
//
//  Created by André Helaehil on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"



@implementation LetraViewController

@synthesize imagem;

- (void) viewDidLoad{
    [super viewDidLoad];
    _sing = [Singleton instance];
    self.title = [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *prev = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(prev:)];
    self.navigationItem.leftBarButtonItem=prev;
    
    UIBarButtonItem *edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(edit:)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 150, 150)];
    label.text= [NSString stringWithFormat:[_sing.palavras objectAtIndex:_sing.letra]];
    label.textAlignment = NSTextAlignmentCenter;
    
    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(90, 250, 150, 150)];
    imagem.image = [UIImage imageNamed:[_sing.imagens objectAtIndex:_sing.letra]];
    imagem.userInteractionEnabled = YES;
    
    [self.view addSubview:imagem];
    [self.view addSubview:label];
    
    UILongPressGestureRecognizer *apertoLongo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(apertoLongo:)];
    [imagem addGestureRecognizer:apertoLongo];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [imagem addGestureRecognizer:pinch];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource: [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]] ofType:@"mp3"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    _som =[[AVAudioPlayer alloc] initWithData:fileData error:NULL];
    _som.volume = 1.0;
    _som.delegate = self;
    
}


- (void) next: (id) sender{
    _sing= [Singleton instance];
    if (_sing.letra == 25) {
        _sing.letra = 0;
    }
    else{
    _sing.letra ++;
    }
    LetraViewController *lc = [[LetraViewController alloc] init];
    [self.navigationController pushViewController:lc animated:NO];
    
}

- (void) prev: (id) sender{
    
    _sing = [Singleton instance];
    if(_sing.letra == 0){
        _sing.letra = 25;
    }
    else{
    _sing.letra --;
    }
    [self.navigationController popViewControllerAnimated:NO];
}

- (void) edit: (id) sender{
    
}

- (void) pinch: (UIPinchGestureRecognizer *) sender{
    
}

- (void) apertoLongo: (UILongPressGestureRecognizer *) sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.5 animations:^{
            imagem.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    }];
        [self.som play];
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }];
    }
    
}


@end
