//
//  LetraViewController.h
//  Navigation
//
//  Created by André Helaehil on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import <AVFoundation/AVFoundation.h>

@interface LetraViewController : UIViewController<AVAudioPlayerDelegate>
@property (nonatomic, strong) Singleton *sing;
@property (nonatomic, strong) UIImageView *imagem;
@property (nonatomic, strong) AVAudioPlayer *som;
@end
