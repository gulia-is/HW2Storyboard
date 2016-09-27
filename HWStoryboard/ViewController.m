//
//  ViewController.m
//  HWStoryboard
//
//  Created by Ildar Zalyalov on 24.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray* wordsArr;
@property (strong, nonatomic) NSArray* colorsArr;
@property (strong, nonatomic) UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([self isEqual: self.navigationController.viewControllers.firstObject]) {
        
                    self.firstLabel = [UILabel new];
                    self.firstLabel.text = @"This is my photo gallery";
                    [self.firstLabel sizeToFit];
                    self.firstLabel.center = self.view.center;
                    [self.view  addSubview:_firstLabel];
                
                }
    self.wordsArr = @[@"Good", @"Beautiful", @"Cool", @"Great", @"Nice"];
    self.colorsArr = @[[UIColor grayColor],[UIColor yellowColor],[UIColor redColor],[UIColor brownColor],[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
        NSInteger randomValue = arc4random_uniform(self.colorsArr.count);
        self.view.backgroundColor = self.colorsArr[randomValue];
        NSInteger buttonRandomColour = arc4random_uniform(self.colorsArr.count);
        self.firstButton.backgroundColor = self.colorsArr[buttonRandomColour];
    }

- (void)viewDidAppear:(BOOL)animated {
    
        [super viewDidAppear:YES];
        NSInteger randomValue = arc4random_uniform(self.wordsArr.count);
        [self.firstButton setTitle:self.wordsArr[randomValue] forState:UIControlStateNormal];
        [_firstButton sizeToFit];
    }

- (IBAction)doneButton:(id)sender
{
        [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
