//
//  ViewController.m
//  brownfieldrn
//
//  Created by Frank Calise on 1/12/23.
//
#import <React/RCTRootView.h>
#import "SecondViewController.h"
#import "AppDelegate.h"
#import "brownfieldrn-Bridging-Header.h"
#import "brownfieldrn-Swift.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    ReactViewController *reactViewController = [[ReactViewController alloc] initWithModuleName:@"RNSuperModule" bridge:appDelegate.bridge initialProperties:@{
        @"initialRouteName": @"FindPage"
        }];
    [reactViewController.view setFrame:self.view.bounds];
    [self.view addSubview:reactViewController.view];

    
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
//    // Do any additional setup after loading the view.
//    RCTRootView *rootView =
//    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
//                                moduleName: @"RNSuperModule"
//                         initialProperties:
//     @{
//        @"initialRouteName": @"FindPage"
//      }
//                             launchOptions: nil];
//    self.view = rootView;

}


@end
