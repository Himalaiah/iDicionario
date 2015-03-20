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

-(void) viewDidLoad{
    [super viewDidLoad];
    _sing = [Singleton instance];
    self.title = [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *prev = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(prev:)];
    self.navigationItem.leftBarButtonItem=prev;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 150, 150)];
    label.text= [NSString stringWithFormat:[_sing.palavras objectAtIndex:_sing.letra]];
    label.textAlignment = NSTextAlignmentCenter;
    
    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 150, 150)];
    imagem.image = [UIImage imageNamed:[_sing.imagens objectAtIndex:_sing.letra]];
    imagem.userInteractionEnabled = YES;
    
    [self.view addSubview:imagem];
    [self.view addSubview:label];
    
    UILongPressGestureRecognizer *apertoLongo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(apertoLongo:)];
    [imagem addGestureRecognizer:apertoLongo];
}

- (void) next: (id) sender{
    _sing= [Singleton instance];
    _sing.letra ++;
    
}

- (void) prev: (id) sender{
    
    _sing = [Singleton instance];
    _sing.letra --;
}

- (void) apertoLongo: (UILongPressGestureRecognizer *) sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.5 animations:^{
            imagem.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    }];
        //[self tocarSom];
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }];
    }
    
}

//- (void) tocarSom{
//    NSString *fileName = [NSString stringWithFormat:@"%d", _sing.letra];
//    
//    NSLog(@"%@", fileName);
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
//    
//    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: path];
//    
//    _som =[[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:NULL];
//    
//    _som.volume = 1.0;
//    
//    _som.delegate = self;
//    
//    [_som prepareToPlay];
//    
//    [_som play];
//}

@end
