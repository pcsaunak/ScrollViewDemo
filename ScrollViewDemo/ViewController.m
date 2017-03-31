//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by Saunak Choudhury on 01/03/17.
//  Copyright © 2017 SaunakChoudhury. All rights reserved.
//

#import "ViewController.h"
#import "AdMarvelDelegate.h"
#import "AdMarvelView.h"

@interface ViewController ()

<AdMarvelDelegate>
{
    AdMarvelView* adMarvelView;
    AdMarvelView* adMarvelView1;
    AdMarvelView* adMarvelView2;
}
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    adMarvelView = [AdMarvelView createAdMarvelViewWithDelegate:self];
    [adMarvelView getAdWithNotification];
    
    adMarvelView1 = [AdMarvelView createAdMarvelViewWithDelegate:self];
    [adMarvelView1 getAdWithNotification];
    
    adMarvelView2 = [AdMarvelView createAdMarvelViewWithDelegate:self];
    [adMarvelView2 getAdWithNotification];
}


-(void)viewDidLayoutSubviews
{
    // The scrollview needs to know the content size for it to work correctly
    [self.scrollView setContentSize:CGSizeMake(320, 1000)];
}


- (NSString*)partnerId:(AdMarvelView*)adMarvelView
{
    return @"100b70a8a2248717";
}

- (NSString*)siteId:(AdMarvelView*)adMarvelView
{
//    return @"117781";
    return @"114812";
}

- (UIViewController *)applicationUIViewController:(AdMarvelView *)adMarvelView
{
    return self;
}


- (CGRect) adMarvelViewFrame:(AdMarvelView*)adMarvelView
{
    
    CGFloat frameY;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.height;
    
    frameY = screenWidth;
    return CGRectMake(0,0,320,50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)getAdSucceeded:(AdMarvelView *)adMarvelView
{
    [self.demoView addSubview:adMarvelView];
    [self.DemoView1 addSubview:adMarvelView1];
    [self.DemoView2 addSubview:adMarvelView2];
}

-(void)getAdFailed:(AdMarvelView *)adMarvelView
{
    NSLog(@"Failure saunak");
}


// This is an admarvel delegate method. Which is called when the ad gets expanded.
-(void)adDidExpand:(AdMarvelView *)adMarvelView
{
    NSLog(@" Ad did expand !!!! ");
}

// Scroll view delegate methods, from which we can invoke the admarvel "collapseAd" API to get get back the initial state of the ad.
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [adMarvelView collapseAd];
    [adMarvelView1 collapseAd];
    [adMarvelView2 collapseAd];
    
}


- (void)collapseAd
{
    [adMarvelView collapseAd];
}
@end
