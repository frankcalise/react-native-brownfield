//
//  ViewController.m
//  brownfieldrn
//
//  Created by Frank Calise on 1/12/23.
//
#import <React/RCTRootView.h>
#import "ViewController.h"
#import "AppDelegate.h"
#import "brownfieldrn-Bridging-Header.h"
#import "brownfieldrn-Swift.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget: self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Navigate to RN exp" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(width/4, 200, width/2, 50)];
    
    [self.view addSubview:button];

}

- (void)handleButtonPress:(UIButton*)sender
{
    NSLog(@"button tapped");
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    ReactViewController *reactViewController = [[ReactViewController alloc] initWithModuleName:@"RNSuperModule"
        bridge:appDelegate.bridge
        initialProperties:@{
            @"initialRouteName": @"SuperModule",
            @"screenProps": @[
                @{@"scores" : @[
                    @{
                        @"name" : @"Alex",
                        @"value": @"42"
                    },
                    @{
                        @"name" : @"Joel",
                        @"value": @"10"
                    }
                ]
            }]
    }];
    [reactViewController.view setFrame:self.view.bounds];
    [self.view addSubview:reactViewController.view];
//        [self presentViewController: reactViewController animated:YES completion:nil];
}

- (void)dismissModal
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
