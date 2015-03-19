//
//  LetraViewController.m
//  Navigation
//
//  Created by André Helaehil on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"

@implementation LetraViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    _sing = [Singleton instance];
    self.title = [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *prev = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(prev)];
    self.navigationItem.leftBarButtonItem=prev;
    
    UILabel *label = [[UILabel alloc] init];
    label.center = self.view.center;
    label.text= [NSString stringWithFormat:[_sing.palavras objectAtIndex:_sing.letra]];

    
    UIImageView *imagem = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    imagem = [_sing.imagens objectAtIndex:_sing.letra];
    [self.view addSubview:imagem];
    [self.view addSubview:label];
}
- (void) viewWillAppear:(BOOL) animated{

}

- (void) next{
    _sing= [Singleton instance];
    _sing.letra ++;
}

- (void) prev{
    _sing = [Singleton instance];
    _sing.letra --;
}

@end
