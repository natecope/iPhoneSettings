//
//  ViewController.m
//  iPhoneSettings
//
//  Created by Nathan Cope on 9/2/14.
//  Copyright (c) 2014 PlumChoice Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *sizeTextField;
@property (weak, nonatomic) IBOutlet UISwitch *videoSwitch;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // register settings with nsuserdefaults
    [self registerDefaultSettings];
    
    // load settings
    [self loadSettings];

    
}


- (void)registerDefaultSettings{
    
    NSDictionary *settings = @{@"fontSize": @10,
                               @"videoOn": @NO,
                               @"volumeSliderMin": @0,
                               @"volumeSliderMax": @100,
                               @"volume" : @15
                               };
    
    
    [[NSUserDefaults standardUserDefaults]registerDefaults:settings];
    
}

-(void)loadSettings {
    self.sizeTextField.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"fontSize"];
    self.videoSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"videoOn"];
    self.volumeSlider.minimumValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"volumeSliderMin"];
    self.volumeSlider.maximumValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"volumeSliderMax"];
    self.volumeSlider.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"volume"];
}

-(void)saveSettings{
    
    
    [[NSUserDefaults standardUserDefaults]setObject:self.sizeTextField.text forKey:@"fontSize"];
    [[NSUserDefaults standardUserDefaults]setBool:self.videoSwitch.on forKey:@"videoOn"];
    [[NSUserDefaults standardUserDefaults]setFloat:self.volumeSlider.minimumValue forKey:@"volumeSliderMin"];
    [[NSUserDefaults standardUserDefaults]setFloat:self.volumeSlider.maximumValue forKey:@"volumeSliderMax"];
    [[NSUserDefaults standardUserDefaults]setFloat:self.volumeSlider.value forKey:@"volume"];
    
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (IBAction)doneButtonPressed:(id)sender {
    
    
    [self saveSettings];
    
}
@end
