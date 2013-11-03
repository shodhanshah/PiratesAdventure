//
//  SSViewController.h
//  PiratesAdventure
//
//  Created by Shodhan Shah on 10/21/13.
//  Copyright (c) 2013 Shodhan Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCharacter.h"
#import "SSBoss.h"

@interface SSViewController : UIViewController
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic)NSMutableArray *tileSet;
@property (strong, nonatomic) SSCharacter *character;
    
@property  (strong, nonatomic)SSBoss *boss;
//IBOutlets
@property (weak, nonatomic) IBOutlet UIImageView *BgImage;
@property (strong, nonatomic) IBOutlet UILabel *HealthNumber;
@property (strong, nonatomic) IBOutlet UILabel *DamageNumber;


@property (strong, nonatomic) IBOutlet UILabel *WeaponName;

@property (strong, nonatomic) IBOutlet UILabel *ArmourName;

@property (strong, nonatomic) IBOutlet UILabel *StoreyLabel;

@property (strong, nonatomic) IBOutlet UIButton *ActionButton;
@property (strong, nonatomic) IBOutlet UIButton *North;

@property (strong, nonatomic) IBOutlet UIButton *East;
@property (strong, nonatomic) IBOutlet UIButton *South;

@property (strong, nonatomic) IBOutlet UIButton *West;
@property (strong, nonatomic) IBOutlet UIButton *ResetButton;

//IBActions

- (IBAction)ActionButtonAction:(UIButton *)sender;
- (IBAction)NorthAction:(UIButton *)sender;
- (IBAction)EastAction:(UIButton *)sender;
- (IBAction)SouthAction:(UIButton *)sender;

- (IBAction)WestAction:(UIButton *)sender;

- (IBAction)ResetAction:(UIButton *)sender;







@end
