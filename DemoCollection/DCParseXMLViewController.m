//
//  DCParseJSONKitViewController.m
//  DemoCollection
//
//  Created by liushuai on 2017/12/15.
//  Copyright © 2017年 liu. All rights reserved.
//

#import "DCParseXMLViewController.h"
#import "XMLUtil.h"
#import "PersonObj.h"

@interface DCParseXMLViewController ()


@end

@implementation DCParseXMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)xmlParserAction:(id)sender {
    XMLUtil *xmlUtil = [[XMLUtil alloc] init];
    [xmlUtil parse];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
