//
//  LetraViewController.h
//  Navigation
//
//  Created by André Helaehil on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DicionarioSingleton.h"
#import <AVFoundation/AVFoundation.h>
#import "EditViewController.h"

@interface LetraViewController : UIViewController<AVAudioPlayerDelegate>
@property (nonatomic, strong) DicionarioSingleton *sing;
@property (nonatomic, strong) UIImageView *imagem;
@property (nonatomic, strong) AVAudioPlayer *som;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *data;
@property (nonatomic, strong) UILabel *palavra;
@property (nonatomic) int controle;
@end
