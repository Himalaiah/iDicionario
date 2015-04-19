//
//  LetraViewController.m
//  Navigation
//
//  Created by André Helaehil on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"



@implementation LetraViewController

@synthesize imagem, palavra, data;

- (void) viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    _controle = 0;
    
    CGRect viewFrame = CGRectMake(0, -40, self.view.bounds.size.width, self.view.bounds.size.height + 45);
    
    //Adiciona uma imagem de fundo e dimensiona com o fundo
    UIImage *background = [UIImage imageNamed:@"pokedex4.png"];
    
    UIImage *scaledImage = [UIImage imageWithCGImage:[background CGImage]
                                               scale:(background.scale * 1.8)
                                         orientation:(background.imageOrientation)];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:viewFrame];
    [backgroundView setImage:scaledImage];
    
    [self.view addSubview:backgroundView];
    

    //Instancia o Singleton e coloca o título a letra como título na navigation
    _sing = [DicionarioSingleton instance];
    self.title = [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]];
    
    //Define os botões da esquerda e diretia da navigation bar
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *prev = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(prev:)];
    self.navigationItem.leftBarButtonItem=prev;
    
    //Instancia a label cujo texto é a palavra
    palavra = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, 150, 100)];
    palavra.text= [NSString stringWithFormat:@"%@", [_sing.palavras objectAtIndex:_sing.letra]];
    palavra.textAlignment = NSTextAlignmentCenter;
    
    //Instancia a label cujo texto é a data
    data = [[UILabel alloc] initWithFrame:CGRectMake(90, 378, 150, 100)];
    data.text= [NSString stringWithFormat:@"%@", [_sing.datas objectAtIndex:_sing.letra]];
    data.textAlignment = NSTextAlignmentCenter;
    
    //Instancia a imagem que é a imagem do pokémon
    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(90, 150, 150, 150)];
    imagem.image = [_sing.imagens objectAtIndex:_sing.letra];
    imagem.userInteractionEnabled = YES;
    
    //Adiciona imagem, palavra e data na tela
    [self.view addSubview:imagem];
    [self.view addSubview:palavra];
    [self.view addSubview:data];
    
    //Instancia 3 ações para a imagem através de diferentes gestos
    UILongPressGestureRecognizer *apertoLongo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(apertoLongo:)];
    [imagem addGestureRecognizer:apertoLongo];
    
    UIPanGestureRecognizer *arrastar = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(arrastar:)];
    [imagem addGestureRecognizer:arrastar];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [imagem addGestureRecognizer:pinch];
    
    //Pega a imagem do arquivo
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource: [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]] ofType:@"mp3"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    //Instancia o som
    _som =[[AVAudioPlayer alloc] initWithData:fileData error:NULL];
    _som.volume = 1.0;
    _som.delegate = self;
    
    //Instancia a toolbar e coloca o botão de editar nela além de fazê-la "sumir da tela
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 143, 320, 44)];
    UIBarButtonItem *botaoEdit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar:)];
    _toolbar.items = [NSArray arrayWithObjects:botaoEdit,nil];
    
    _toolbar.backgroundColor = [UIColor clearColor];
    _toolbar.barTintColor = [UIColor clearColor];
    [_toolbar setBackgroundImage:[UIImage new]
                  forToolbarPosition:UIBarPositionAny
                          barMetrics:UIBarMetricsDefault];
    [_toolbar setShadowImage:[UIImage new]
              forToolbarPosition:UIToolbarPositionAny];
    
    //Adiciona toolbar na tela
    [self.view addSubview:_toolbar];
    
}

- (void) viewWillAppear:(BOOL)animated{
    if (_controle == 0) {
    [_som play];
    CGRect frame = imagem.frame;
    frame.origin.y += 50;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse
                     animations:^{
                         imagem.frame = frame;
                         imagem.transform = CGAffineTransformMakeScale(0.8f, 0.8f);
                         imagem.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                     }
                     completion:NULL
     ];
    _controle = 1;
    }
}

- (void) viewDidAppear:(BOOL)animated{
    imagem.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
}

- (void) next: (id) sender{
    _sing= [DicionarioSingleton instance];
    if (_sing.letra == 25) {
        _sing.letra = 0;
    }
    else{
    _sing.letra ++;
    }
    LetraViewController *lvc = [[LetraViewController alloc] init];
    [self.navigationController pushViewController:lvc animated:NO];
    [self.navigationController dismissViewControllerAnimated:NO completion:nil ];
    
}

- (void) prev: (id) sender{
    
    _sing = [DicionarioSingleton instance];
    if(_sing.letra == 0){
        _sing.letra = 25;
    }
    else{
    _sing.letra --;
    }
    LetraViewController *lvc = [[LetraViewController alloc] init];
    [self.navigationController pushViewController:lvc animated:NO];
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}

- (void) pinch: (UIPinchGestureRecognizer *) recognizer{

}

- (void) apertoLongo: (UILongPressGestureRecognizer *) recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.5 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
    }];
        [self.som play];
    }
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }];
    }
}

- (void) arrastar: (UIPanGestureRecognizer *) recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
 }
                      
- (void) editar: (id) sender{
    EditViewController *edv = [[EditViewController alloc] init];
    edv.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:edv animated:YES completion:nil];
}



@end
