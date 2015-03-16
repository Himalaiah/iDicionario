//
//  Singleton.m
//  Navigation
//
//  Created by André Helaehil on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *instancia;

- (instancetype) init{
    self = [super init];
    if(self){
        _letra = 0;
        _palavras = [NSArray arrayWithObjects:@"Articuno", @"Blastoise", @"Charizard", @"Dragonite", @"Eevee", @"Farfetch`d", @"Gengar", @"Hypno", @"Ivysaur", @"Jigglybuff", @"Kangaskhan", @"Lapras", @"Mew", @"Ninetales", @"Omastar", @"Pikachu", @"Qwilfish", @"Rhydon", @"Snorlax", @"Tauros", @"Ursaring", @"Venomoth", @"Weezing", @"Xatu", @"Yanma", @"Zapdos", nil];
        _imagens = [[NSArray alloc] init];
        
    }
    return self;
}

+ (Singleton *) instance{
    if(instancia==nil){
        instancia = [[Singleton alloc] init];
    }
    return instancia;
}

@end
