//
//  DCLeanCloudUserViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/22.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCLeanCloudUserViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface DCLeanCloudUserViewController ()

@property (nonatomic,strong) UIView *loginView;
@property (nonatomic,strong) UITextField *textFieldUserName;
@property (nonatomic,strong) UITextField *textFieldPasswd;
@property (nonatomic,strong) UIButton *btnRegister;
@property (nonatomic,strong) UIButton *btnLogin;

@property (nonatomic,strong) UIView *userView;
@property (nonatomic,strong) UIButton *btnLogout;

@end

@implementation DCLeanCloudUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [AVOSCloud setApplicationId:cLeanCloudAppId clientKey:cLeanCloudAppKey];
    
    [self layoutUI];
    
    [self reloadView];
}

- (void)layoutUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loginView = ({
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        self.view.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:view];
        view;
    });
    
    self.textFieldUserName = ({
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, CC_SCREEN_WIDTH-200, 30)];
        textField.placeholder = @"userName";
        [self.loginView addSubview:textField];
        textField;
    });
    
    self.textFieldPasswd = ({
        CGRect frame = self.textFieldUserName.frame;
        frame.origin.y += 80;
        UITextField *textField = [[UITextField alloc] initWithFrame: frame];
        textField.placeholder = @"password";
        [self.loginView addSubview:textField];
        textField.secureTextEntry = YES;
        textField;
    });
    
    self.btnLogin = ({
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"登录" forState: UIControlStateNormal];
        [btn setBackgroundColor:[UIColor greenColor]];
        CGRect frame = self.textFieldPasswd.frame;
        frame.origin.y += 80;
        [btn setFrame:frame];
        [self.loginView addSubview:btn];
        [btn addTarget:self action:@selector(doLogin:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    self.btnRegister = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"注册" forState: UIControlStateNormal];
        CGRect frame = self.btnLogin.frame;
        frame.origin.y += 80;
        [btn setFrame:frame];
        [self.loginView addSubview:btn];
        [btn setBackgroundColor:[UIColor greenColor]];
        [btn addTarget:self action:@selector(doRegister:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    self.userView = ({
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        self.view.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:view];
        view;
    });
    
    self.btnLogout = ({
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"退出" forState: UIControlStateNormal];
        CGRect frame = self.textFieldPasswd.frame;
        frame.origin.y += 80;
        [btn setFrame:frame];
        [self.userView addSubview:btn];
        [btn addTarget:self action:@selector(doLogout:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
}

- (void)doLogin:(UIButton *)btn {
    NSString *username = self.textFieldUserName.text;
    NSString *password = self.textFieldPasswd.text;
    if (username && password) {
        [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser * _Nullable user, NSError * _Nullable error) {
            if (!error) {
//                [[AVUser currentUser] addObserver:self forKeyPath:@"sessionTokenField" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
                [self reloadView];
//                [AVUser addObserver:self forKeyPath:@"currentUser" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
            } else {
                DLog(@"login error = %@",error.localizedDescription);
            }
        }];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"currentUser"]) {
        DLog(@"session token change ");
        [self reloadView];
    }
}

- (void)doRegister:(UIButton *)btn {
    NSString *username = self.textFieldUserName.text;
    NSString *password = self.textFieldPasswd.text;
    if (username && password) {
        // LeanCloud - 注册
        // https://leancloud.cn/docs/leanstorage_guide-objc.html#用户名和密码注册
        AVUser *user = [AVUser user];
        user.username = username;
        user.password = password;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                DLog(@"注册成功");
            } else {
                NSLog(@"注册失败 %@", error);
            }
        }];
    }
}

- (void)doLogout:(UIButton *)btn {
    [AVUser logOut];
    [self reloadView];
}

- (void)reloadView {
    if ([AVUser currentUser]) {
        [self.loginView setHidden:YES];
        [self.userView setHidden:NO];
    } else {
        [self.loginView setHidden:NO];
        [self.userView setHidden:YES];
    }
}
@end
