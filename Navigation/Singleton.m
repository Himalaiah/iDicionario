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
        _palavras = [NSArray arrayWithObjects:@"Articuno", @"Blastoise", @"Charizard", @"Dragonite", @"Eevee", @"Farfetch'd", @"Gengar", @"Hypno", @"Ivysaur", @"Jigglybuff", @"Kangaskhan", @"Lapras", @"Mew", @"Ninetales", @"Omastar", @"Pikachu", @"Qwilfish", @"Rhydon", @"Snorlax", @"Tauros", @"Ursaring", @"Venomoth", @"Weezing", @"Xatu", @"Yanma", @"Zapdos", nil];
        _imagens = [NSArray arrayWithObjects:@"A.png", @"B.png", @"C.png",@"D.png", @"E.png", @"F.png", @"G.png", @"H.png", @"I.png", @"J.png", @"K.png", @"L.png", @"M.png", @"N.png", @"O.png", @"P.png", @"Q.png", @"R.png", @"S.png", @"T.png", @"U.png", @"V.png", @"W.png", @"X.png", @"Y.png", @"Z.png", nil];
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
