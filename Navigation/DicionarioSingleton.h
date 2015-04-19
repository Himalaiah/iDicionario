//
//  DicionarioSingleton.h
//  Navigation
//
//  Created by André Helaehil on 14/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicionarioSingleton : NSObject


@property (nonatomic) NSMutableArray *palavras;
@property (nonatomic) NSMutableArray *imagens;
@property (nonatomic) int letra;
@property (nonatomic) NSMutableArray *datas;
@property (nonatomic) NSArray *imagensOrigem;
@property (nonatomic) UIImage *imagem;

- (instancetype) init;
+ (DicionarioSingleton* ) instance;

@end
