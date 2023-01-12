//
//  ViewController.m
//  brownfieldrn
//
//  Created by Frank Calise on 1/12/23.
//
#import <React/RCTRootView.h>
#import "ViewController.h"


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
    
    // TODO need a production main bundle here
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"RNSuperModule"
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
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
