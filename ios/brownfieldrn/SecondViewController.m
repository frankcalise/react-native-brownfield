//
//  ViewController.m
//  brownfieldrn
//
//  Created by Frank Calise on 1/12/23.
//
#import <React/RCTRootView.h>
#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    // Do any additional setup after loading the view.
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"FindPage"
                         initialProperties:
     @{
        @"scores" : @[
            @{
                @"name" : @"Alex",
                @"value": @"42"
            },
            @{
                @"name" : @"Joel",
                @"value": @"10"
            }
        ]
    }
                             launchOptions: nil];
    
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view = rootView;
    self.view = rootView;

}


@end
