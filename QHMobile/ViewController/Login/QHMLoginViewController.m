//
//  QHMLoginViewController.m
//  QHMobile
//
//  Created by yao on 15/2/3.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMLoginViewController.h"
#import "QHMainViewController.h"
#import "QHRegisterViewController.h"
#import "NavBaseViewController.h"
#import "CheckButton.h"
#define kIDTextTag                  1 
#define kPwdTextTag                 2
@interface QHMLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *userPwd;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIImageView *regisertImgTip;
@property (weak, nonatomic) IBOutlet UIButton *goRegister;
@property (weak, nonatomic) IBOutlet UIImageView *idImgFocus;
@property (weak, nonatomic) IBOutlet UIImageView *pwdImgFocus;
@property (weak, nonatomic) IBOutlet CheckButton *remberPwdBtn;



- (IBAction)LoginAction:(id)sender;
- (IBAction)goRegister:(id)sender;

- (IBAction)remberPwdAction:(id)sender;
@end

@implementation QHMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.loginBtn setTitleColor:[UIColor colorWithHex:0xFF424242] forState:UIControlStateNormal];
    self.navigationController.navigationBarHidden = YES;
    if (iPhone4)
    {
        self.loginView.top -= 44;
        self.loginView.height += 40;
    }
    CGFloat tipPadding = -10;
    if (iPhone6)
        tipPadding = 20;
    if (iPhone6Plus)
        tipPadding = 40;
    self.regisertImgTip.left = self.registerBtn.left + self.registerBtn.width + tipPadding;
    //tag
    self.userID.tag = kIDTextTag ;
    self.userPwd.tag = kPwdTextTag;
    
    //tap
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore hiddenLoginNav:YES];

}

- (void)hideKeyBoard
{
    [self.userPwd resignFirstResponder];
    [self.userID resignFirstResponder];
}
#pragma mark --判断当开始编辑文本框时候，黄色线条是否出现
- (void)showFocusImageWithTextFieldTag:(NSInteger)tag
{
    if (tag == kIDTextTag) {
        self.idImgFocus.hidden = !self.idImgFocus.hidden ;
    }
    if (tag == kPwdTextTag) {
        self.pwdImgFocus.hidden = !self.pwdImgFocus.hidden;
    }

}
#pragma mark -textfield 
- (void)textFieldDidBeginEditing:(UITextField *)textField         // became first responder
{
    [self showFocusImageWithTextFieldTag:textField.tag];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
   [self showFocusImageWithTextFieldTag:textField.tag];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginAction:(id)sender {
    QHMainViewController *qhCtrl = [[QHMainViewController alloc] initWithNibName:@"QHMLoginViewController" bundle:nil];
    [self presentViewController:qhCtrl animated:YES completion:nil];
//    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
//    
//    selfCallBack.doneBlock = ^(id result,NSUInteger tag)
//    {
////        NoNetView *noView =(NoNetView *) [bself.view viewWithTag:kViewTag];
////        [noView hide];
////        bself.brandArray = result;
////        [bself reloadView];
//        // [weakSelf.baseTableView headerEndRefreshing];
//        NSString *info = [result objectForKey:@"info"];
////        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"t" message:info delegate:nil cancelButtonTitle:@"ce" otherButtonTitles:nil, nil];
////        [alert show];
//         NSLog(@"%@",info);
//    };
//    selfCallBack.failedBlock = ^(NSError *error)
//    {
//        if (error.NetState == ErrorNoNet)
//        {
////            NoNetView *noView = [[NoNetView alloc] initWithSelect:@selector(refreshView) withTarget:bself targetView:bself.view];
////            noView.tag = kViewTag;
////            [noView showInView:bself.view];
//        }
//    };
//   [MANAGER loginWithPhone:@"133013398220" pwd:@"123456" callBack:selfCallBack target:self];
//  // [MANAGER checkinWithLng:@"102.112239" lat:@"36.504831" gid:@"1" address:@"青海省海东地区平安县平安路122" callBack:selfCallBack];
//   // [MANAGER selectDepartmentWithID:@"1" callBack:selfCallBack];
//    [MANAGER checkListWithCallBack:selfCallBack];
   // [MANAGER checkWithType:@"1" callBack:selfCallBack];
   // [MANAGER workApplicationWithType: ctype:<#(NSString *)#> s_time:<#(NSString *)#> e_time:<#(NSString *)#> reason:<#(NSString *)#> callBack:<#(HttpCallBack *)#>];
    //[MANAGER applicationListMoreWithType:@"1" callBack:selfCallBack];
   // [MANAGER accountListWithCallBack:selfCallBack];
   //  [MANAGER submitApplicationListMoreWithItem:<#(NSString *)#> callBack:<#(HttpCallBack *)#>];
   // [MANAGER userAllInfoWithCallBack:selfCallBack];
}


- (IBAction)goRegister:(id)sender {
//    QHRegisterViewController *registerCtrl = [[QHRegisterViewController alloc] initWithNibName:@"QHRegisterViewController" bundle:nil];
//    
//    [theUICore.loginNav pushViewController:registerCtrl animated:YES];
//    [MBProgressHUD showHUDAddedTo:self.view
//                         animated:YES];
 //   [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hideProgess) userInfo:nil repeats:NO];
}

//- (void)hideProgess
//{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}
- (IBAction)remberPwdAction:(id)sender {
    if (!self.remberPwdBtn.checkOn)
        [self.remberPwdBtn setImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];
    else
        [self.remberPwdBtn setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
        
    self.remberPwdBtn.checkOn = !self.remberPwdBtn.checkOn ;

}
@end
