//
//  DicionarioSingleton.m
//  Navigation
//
//  Created by André Helaehil on 14/04/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioSingleton.h"

@implementation DicionarioSingleton

static DicionarioSingleton *instancia;

- (instancetype) init{
    self = [super init];
    if(self){
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateStyle:NSDateFormatterMediumStyle];
        NSString *data = [format stringFromDate:[NSDate date]];
        _letra = 0;
        _palavras = [NSMutableArray arrayWithObjects:@"Articuno", @"Blastoise", @"Charizard", @"Dragonite", @"Eevee", @"Farfetch'd", @"Gengar", @"Hypno", @"Ivysaur", @"Jigglypuff", @"Kangaskhan", @"Lapras", @"Moltres", @"Ninetales", @"Omastar", @"Pikachu", @"Qwilfish", @"Rhydon", @"Snorlax", @"Tauros", @"Ursaring", @"Venomoth", @"Weezing", @"Xatu", @"Yanma", @"Zapdos", nil];
        _imagensOrigem = [NSArray arrayWithObjects:@"A.png", @"B.png", @"C.png",@"D.png", @"E.png", @"F.png", @"G.png", @"H.png", @"I.png", @"J.png", @"K.png", @"L.png", @"M.png", @"N.png", @"O.png", @"P.png", @"Q.png", @"R.png", @"S.png", @"T.png", @"U.png", @"V.png", @"W.png", @"X.png", @"Y.png", @"Z.png", nil];
        _imagens = [[NSMutableArray alloc] init];
        for (int i = 0; i<_imagensOrigem.count; i++) {
            _imagem = [UIImage imageNamed:[_imagensOrigem objectAtIndex:i]];
            [_imagens addObject:_imagem];
        }
        _datas = [[NSMutableArray alloc] initWithObjects:data, data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data,data, nil];
    }
    return self;
}

+ (DicionarioSingleton *) instance{
    if(instancia==nil){
        instancia = [[DicionarioSingleton alloc] init];
    }
    return instancia;
}

@end
