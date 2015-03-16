//
//  Singleton.h
//  Navigation
//
//  Created by André Helaehil on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (nonatomic) NSArray *palavras;
@property (nonatomic) NSArray *imagens;
@property (nonatomic) NSInteger *letra;

- (instancetype) init;
+ (Singleton* ) instance;
@end
