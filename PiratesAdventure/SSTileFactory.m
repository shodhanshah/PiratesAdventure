//
//  SSTileFactory.m
//  PiratesAdventure
//
//  Created by Shodhan Shah on 10/22/13.
//  Copyright (c) 2013 Shodhan Shah. All rights reserved.
//

#import "SSTileFactory.h"
#import "SSTile.h"

@implementation SSTileFactory
    
-(NSMutableArray *) tiles{
    
    NSMutableArray *column1=[[NSMutableArray alloc]init];
    NSMutableArray *column2=[[NSMutableArray alloc]init];
    NSMutableArray *column3=[[NSMutableArray alloc]init];
    NSMutableArray *column4=[[NSMutableArray alloc]init];
    NSMutableArray *columns=[[NSMutableArray alloc]init];
    
    
    
    NSString *tilePropsFile= [[NSBundle mainBundle] pathForResource:@"TileProps" ofType:@"plist"];
    
    NSDictionary *tileDict= [[NSDictionary alloc] initWithContentsOfFile:tilePropsFile];
    
    NSEnumerator *tileKeys=[tileDict keyEnumerator];
    NSString *tileNumber;
    while( tileNumber=[tileKeys nextObject]  ){
        
        NSDictionary *tilePropDict= tileDict[tileNumber];
        NSEnumerator *tilePropKeys=[tilePropDict keyEnumerator];
        
        NSString *propKey;
        NSString *propValue;
        
        NSString *tileStory;
        NSString *tileBGImage;
        NSString *tileactionText;
        NSString *healthEffect;
        
        while (propKey=[tilePropKeys nextObject]) {
            //     NSLog(@"key:%@",key);
            //    NSLog(@"value:%@",tileProps[key]);
            propValue=tilePropDict[propKey];
            
            NSLog(@"Tile :%@ ::: %@:%@ ", tileNumber,propKey,propValue);
            
            if ([propKey isEqualToString:@"story"]) {
                tileStory=propValue;
            }else if([propKey isEqualToString:@"BGImage"]) {
                tileBGImage=propValue;
            }else if([propKey isEqualToString:@"actionText"]) {
                tileactionText=propValue;
            }else if([propKey isEqualToString:@"HealthIndicator"]) {
                healthEffect=propValue;
            }
            
        }
    //    UIImage *tileImage= [[UIImage alloc]initWithContentsOfFile:tileBGImage];
        
        UIImage *tileImage= [UIImage imageNamed:tileBGImage];
        
        
        SSTile *myTile=[[SSTile alloc]initWithImage:tileImage AndActionText:tileactionText AndStory:tileStory];
        myTile.healthEffect=[healthEffect intValue];
        
        if ([tileNumber isEqualToString:@"Tile1"] || [tileNumber isEqualToString:@"Tile2"] ||[tileNumber isEqualToString:@"Tile3"]) {
            [column1 addObject:myTile];
        }else if ([tileNumber isEqualToString:@"Tile4"] || [tileNumber isEqualToString:@"Tile5"] ||[tileNumber isEqualToString:@"Tile6"]){
            [column2 addObject:myTile];
        }else if ([tileNumber isEqualToString:@"Tile7"] || [tileNumber isEqualToString:@"Tile8"] ||[tileNumber isEqualToString:@"Tile9"]){
            [column3 addObject:myTile];
        }else if ([tileNumber isEqualToString:@"Tile10"] || [tileNumber isEqualToString:@"Tile11"] ||[tileNumber isEqualToString:@"Tile12"]){
            [column4 addObject:myTile];
        }
        
    }
    
    [columns addObject:column1];
    [columns addObject:column2];
    [columns addObject:column3];
    [columns addObject:column4];
    
    return columns;
}
    
    - (SSCharacter *)character{
        SSCharacter *mychar= [[SSCharacter alloc]init];
        
        SSWeapon *myweapon= [[SSWeapon alloc]init];
        myweapon.name=@"Fists";
        myweapon.damage=10;
        mychar.weapon=myweapon;
        
        
        SSArmour *myarmour=[[SSArmour alloc]init];
        myarmour.name=@"cloak";
        myarmour.health=5;
        mychar.armours=myarmour;
        
        mychar.health=100;
        
        
        return mychar;
        
        
    }

    - (SSBoss *) boss{
        SSBoss *boss=[[SSBoss alloc]init];
        boss.health=75;
        return boss;
        
    }

    
    
    @end