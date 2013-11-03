//
//  SSViewController.m
//  PiratesAdventure
//
//  Created by Shodhan Shah on 10/21/13.
//  Copyright (c) 2013 Shodhan Shah. All rights reserved.
//

#import "SSViewController.h"
# import "SSTileFactory.h"
@interface SSViewController ()
    
    @end

@implementation SSViewController
    
- (void)viewDidLoad
    {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
        SSTileFactory *factory=[[SSTileFactory alloc]init];
        self.tileSet=[factory tiles];
        self.character=[factory character];
        self.boss=[factory boss];
        self.currentPoint=CGPointMake(0, 0);
        [self updateCharacterWithArmour:nil withWeapon:nil withHealthEffect:0];
        [self updateTile];
        [self updateButtons];
    }
    
- (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

#pragma mark -IBActions
- (IBAction)ActionButtonAction:(UIButton *)sender {
    
    SSTile *modelTile=[[self.tileSet objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    [self updateCharacterWithArmour:modelTile.armour withWeapon:modelTile.weapon withHealthEffect:modelTile.healthEffect];
    [self updateTile];
    
    if(modelTile.healthEffect == -15){
        self.boss.health=self.boss.health-self.character.damage;
    }
    
    if(self.character.health <= 0){
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Lost Message" message:@"You lost . Restart game." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }
    if(self.boss.health <= 0){
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Win Message" message:@"You defeated pirates." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }
    
    
}
    
- (IBAction)NorthAction:(UIButton *)sender {
    
    self.currentPoint= CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self updateButtons];
    [self updateTile];
}
    
- (IBAction)EastAction:(UIButton *)sender {
    self.currentPoint= CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];

}
    
- (IBAction)SouthAction:(UIButton *)sender {
    self.currentPoint= CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    [self updateButtons];
    [self updateTile];
}
 
    
- (IBAction)WestAction:(UIButton *)sender {
    self.currentPoint= CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}
    
    
- (IBAction)ResetAction:(UIButton *)sender {
    self.character=nil;
    self.boss=nil;
    [self viewDidLoad];
    
}
#pragma mark - Helper Methods
    -(void)updateTile{
        
        SSTile *currentTile=[[self.tileSet objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
        self.StoreyLabel.text=currentTile.story;
        
        self.BgImage.image=   currentTile.bgImg;
        
        self.HealthNumber.text=[NSString stringWithFormat:@"%i",self.character.health];
        self.DamageNumber.text=[NSString stringWithFormat:@"%i",self.character.damage];
        self.ArmourName.text=self.character.armours.name;
        self.WeaponName.text=self.character.weapon.name;
        [self.ActionButton setTitle:currentTile.actionButtonText forState:UIControlStateNormal];
    };
 
    -(BOOL)isTileExistOnButtonAction: (CGPoint) point{
        if(point.x >=0 && point.y >=0 && point.x < [self.tileSet count] && point.y < [[self.tileSet objectAtIndex:point.x] count]){
            return NO;
        }else{
            return YES;
        }
        
    }
    
    -(void)updateButtons{
        
        self.West.hidden=[self isTileExistOnButtonAction:CGPointMake(self.currentPoint.x-1, self.currentPoint.y)];
        
        self.East.hidden=[self isTileExistOnButtonAction:CGPointMake(self.currentPoint.x+1, self.currentPoint.y)];
        
        
        self.North.hidden=[self isTileExistOnButtonAction:CGPointMake(self.currentPoint.x, self.currentPoint.y+1)];
        
        
        self.South.hidden=[self isTileExistOnButtonAction:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)];
        
        
        
    }
    
- (void) printTiles{
    for(int i=0; i< [self.tileSet count]; i++){
        NSLog(@"%@",self.tileSet[i]);
        NSMutableArray *columnarr=self.tileSet[i];
        
        for(int j=0; j <[columnarr count];j++){
            NSLog(@"%@",columnarr[j]);
        }
        
    }
}
    
    - (void) updateCharacterWithArmour:(SSArmour *)armour  withWeapon:(SSWeapon *)weapon withHealthEffect:(int)healthIndicator{
        
        if(armour != Nil){
            self.character.health=self.character.health-self.character.armours.health +armour.health;
            self.character.armours=armour;
            
        }else if (weapon != Nil){
            self.character.damage=self.character.damage-self.character.weapon.damage +weapon.damage;
            self.character.weapon=weapon;
            
        }else if(healthIndicator != 0){
            self.character.health=self.character.health+healthIndicator;
        }else{
            self.character.health=self.character.health+self.character.armours.health;
            self.character.damage=self.character.damage+self.character.weapon.damage;
        }
        
    }
    
    @end
