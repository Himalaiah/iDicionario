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
    self.view.backgroundColor = [UIColor clearColor];
    
    CGRect viewFrame = CGRectMake(0, -40, self.view.bounds.size.width, self.view.bounds.size.height + 45);
    
    UIImage *background = [UIImage imageNamed:@"pokedex4.png"];
    
    UIImage *scaledImage = [UIImage imageWithCGImage:[background CGImage]
                                               scale:(background.scale * 1.8)
                                         orientation:(background.imageOrientation)];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:viewFrame];
    [backgroundView setImage:scaledImage];
    
    [self.view addSubview:backgroundView];
    

    _sing = [DicionarioSingleton instance];
    self.title = [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *prev = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(prev:)];
    self.navigationItem.leftBarButtonItem=prev;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, 150, 100)];
    label.text= [NSString stringWithFormat:@"%@", [_sing.palavras objectAtIndex:_sing.letra]];
    label.textAlignment = NSTextAlignmentCenter;
    
    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(90, 200, 150, 150)];
    imagem.image = [UIImage imageNamed:[_sing.imagens objectAtIndex:_sing.letra]];
    imagem.userInteractionEnabled = YES;
    
    
    [self.view addSubview:imagem];
    [self.view addSubview:label];
    
    UILongPressGestureRecognizer *apertoLongo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(apertoLongo:)];
    [imagem addGestureRecognizer:apertoLongo];
    
    UIPanGestureRecognizer *arrastar = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(arrastar:)];
    [imagem addGestureRecognizer:arrastar];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [imagem addGestureRecognizer:pinch];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource: [NSString stringWithFormat:@"%c", [[_sing.palavras objectAtIndex:_sing.letra] characterAtIndex:0]] ofType:@"mp3"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    _som =[[AVAudioPlayer alloc] initWithData:fileData error:NULL];
    _som.volume = 1.0;
    _som.delegate = self;
    
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
    
    [self.view addSubview:_toolbar];
    
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
