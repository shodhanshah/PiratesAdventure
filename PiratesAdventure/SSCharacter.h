//
//  SSCharacter.h
//  PiratesAdventure
//
//  Created by Shodhan Shah on 10/23/13.
//  Copyright (c) 2013 Shodhan Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSWeapon.h"
#import "SSArmour.h"

@interface SSCharacter : NSObject
    
    @property (strong, nonatomic) SSWeapon *weapon;
    
    @property (strong, nonatomic) SSArmour *armours;
    
    @property (nonatomic ) int health;
    
    @property (nonatomic ) int damage;
    
    @end
