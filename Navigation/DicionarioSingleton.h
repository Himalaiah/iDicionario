//
//  DicionarioSingleton.h
//  Navigation
//
//  Created by André Helaehil on 14/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicionarioSingleton : NSObject


@property (nonatomic) NSArray *palavras;
@property (nonatomic) NSArray *imagens;
@property (nonatomic) int letra;

- (instancetype) init;
+ (DicionarioSingleton* ) instance;

@end