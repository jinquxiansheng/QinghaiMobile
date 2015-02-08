//
//  MainViewController.m
//  QHMobile
//
//  Created by yao on 14-9-10.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "QHMainViewController.h"
#import "FirstPageViewController.h"
#import "CheckWorkAttention.h"
#import "AccountViewController.h"
#import "NavBaseViewController.h"
#import "UITabBarController+HideTabBar.h"
#import "PersonalViewController.h"
#import "CommonUI.h"
static  const  CGFloat   tabHeight = 48;
//static  const  int       viewControllerCount = 5;
@interface QHMainViewController ()
{
    
    FirstPageViewController                  *_firstCtrl;
    CheckWorkAttention                      *_checkCtrl;
    AccountViewController                   *_accountCtrl;
    PersonalViewController                  *_personalCtrl;
}

@end

@implementation QHMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT-tabHeight,SCREENWIDTH,tabHeight)];
    self.tabbarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tabbarView];
    [self initViewController];
}
- (void)initViewController
{
    _firstCtrl = [[FirstPageViewController alloc] initWithNibName:@"FirstPageViewController" bundle:nil];
    _checkCtrl = [[CheckWorkAttention alloc] initWithNibName:@"CheckWorkAttention" bundle:nil];
    _accountCtrl  = [[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:nil];
    _personalCtrl = [[PersonalViewController alloc] initWithNibName:@"PersonalViewController" bundle:nil];
    NSArray *views = @[_firstCtrl,_checkCtrl,_accountCtrl,_personalCtrl];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:3];
    for (UIViewController  *viewController in views) {
        NavBaseViewController   *nav = [[NavBaseViewController alloc] initWithRootViewController:viewController];
        [viewControllers addObject:nav];
    }
    self.viewControllers = viewControllers;
    
    self.tabBarHidden = YES;
    NSArray *buttonTextArray = @[@"首页",@"考勤",@"台帐",@"我的"];
    NSArray *buttonImgArray = @[@"nav_home_on",@"nav_kaoqin",@"nav_taizhang",@"nav_my"];
   // NSArray *buttonImgOnArray = @[@"nav_home_on",@"nav_kaoqin_on",@"nav_taizhang_on",@"nav_my_on"];
    CGFloat btnWidth = SCREENWIDTH / buttonTextArray.count;
    CGFloat x  = 0;
    for (int i = 0; i < buttonTextArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, 0, btnWidth, 48);
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
        button.tag = i;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:[buttonTextArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonImgArray[i]]  forState:UIControlStateNormal] ;
        // [button setImage:[UIImage imageNamed:buttonImgOnArray[i]]  forState:UIControlStateHighlighted] ;
        button.titleLabel.textColor = [UIColor blackColor];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabbarView addSubview:button];
        x += btnWidth;
    }
    theUICore.mainViewController = self;
}
- (void)selectedTab: (UIButton *)button
{
    self.selectedIndex = button.tag;
    switch (self.selectedIndex) {
        case 0:
        {
           [button setImage:[UIImage imageNamed:@"nav_home_on"] forState:UIControlStateNormal];
            UIButton *kaoqinBtn = [self.tabbarView.subviews objectAtIndex:1];
            UIButton *taizhangBtn = [self.tabbarView.subviews objectAtIndex:2];
            UIButton *myBtn = [self.tabbarView.subviews objectAtIndex:3];
            [kaoqinBtn setImage:[UIImage imageNamed:@"nav_kaoqin"] forState:UIControlStateNormal];
            [taizhangBtn setImage:[UIImage imageNamed:@"nav_taizhang"] forState:UIControlStateNormal];
            [myBtn setImage:[UIImage imageNamed:@"nav_my"] forState:UIControlStateNormal];
            break;
        }
        case 1:
        {
            [button setImage:[UIImage imageNamed:@"nav_kaoqin_on"] forState:UIControlStateNormal];
            UIButton *homeBtn = [self.tabbarView.subviews objectAtIndex:0];
            UIButton *taizhangBtn = [self.tabbarView.subviews objectAtIndex:2];
            UIButton *myBtn = [self.tabbarView.subviews objectAtIndex:3];
            [homeBtn setImage:[UIImage imageNamed:@"nav_home"] forState:UIControlStateNormal];
            [taizhangBtn setImage:[UIImage imageNamed:@"nav_taizhang"] forState:UIControlStateNormal];
            [myBtn setImage:[UIImage imageNamed:@"nav_my"] forState:UIControlStateNormal];
            break;
        }
            
        case 2:
        {
            [button setImage:[UIImage imageNamed:@"nav_taizhang_on"] forState:UIControlStateNormal];
            UIButton *homeBtn = [self.tabbarView.subviews objectAtIndex:0];
            UIButton *kaoqinBtn = [self.tabbarView.subviews objectAtIndex:1];
            UIButton *myBtn = [self.tabbarView.subviews objectAtIndex:3];
            [homeBtn setImage:[UIImage imageNamed:@"nav_home"] forState:UIControlStateNormal];
            [kaoqinBtn setImage:[UIImage imageNamed:@"nav_kaoqin"] forState:UIControlStateNormal];
            [myBtn setImage:[UIImage imageNamed:@"nav_my"] forState:UIControlStateNormal];
            break;
        }
        case 3:
        {
            [button setImage:[UIImage imageNamed:@"nav_my_on"] forState:UIControlStateNormal];
            UIButton *homeBtn = [self.tabbarView.subviews objectAtIndex:0];
            UIButton *kaoqinBtn = [self.tabbarView.subviews objectAtIndex:1];
            UIButton *taizhangBtn = [self.tabbarView.subviews objectAtIndex:2];
            [homeBtn setImage:[UIImage imageNamed:@"nav_home"] forState:UIControlStateNormal];
            [kaoqinBtn setImage:[UIImage imageNamed:@"nav_kaoqin"] forState:UIControlStateNormal];
            [taizhangBtn setImage:[UIImage imageNamed:@"nav_taizhang"] forState:UIControlStateNormal];
            break;
        }

        default:
            break;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
