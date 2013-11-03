//
//  SSTileFactory.h
//  PiratesAdventure
//
//  Created by Shodhan Shah on 10/22/13.
//  Copyright (c) 2013 Shodhan Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTile.h"
#import "SSCharacter.h"
#import "SSBoss.h"


@interface SSTileFactory : NSObject

-(NSMutableArray *)tiles;
- (SSCharacter *)character;
- (SSBoss *) boss;

@end
