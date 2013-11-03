//
//  SSTile.m
//  PiratesAdventure
//
//  Created by Shodhan Shah on 10/22/13.
//  Copyright (c) 2013 Shodhan Shah. All rights reserved.
//

#import "SSTile.h"

@implementation SSTile

-(id) initWithImage:(UIImage *)img AndActionText:(NSString *)actionText AndStory:(NSString *)tileStory{
    self=[super init];
    if(self){
        _bgImg=img;
        _actionButtonText=actionText;
        _story=tileStory;
    }
    return self;
}
@end
