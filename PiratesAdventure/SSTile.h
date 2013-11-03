//
//  SSTile.h
//  PiratesAdventure
//
//  Created by Shodhan Shah on 10/22/13.
//  Copyright (c) 2013 Shodhan Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSWeapon.h"
#import "SSArmour.h"


@interface SSTile : NSObject
@property (strong,nonatomic) UIImage *bgImg;
@property (strong, nonatomic) NSString *actionButtonText;
@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) SSWeapon *weapon;
@property (strong, nonatomic) SSArmour *armour;
@property (nonatomic) int healthEffect;

- (id) initWithImage:(UIImage *)img AndActionText:(NSString *)actionText AndStory:(NSString *)tileStory;

@end
