//
//  ViewController.m
//  滑动列表
//
//  Created by admin on 2018/2/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import "NLXMainTable.h"
#import "NLXLineView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NLXMainTable *table = [[NLXMainTable alloc] initWithFrame:CGRectMake(0, 0, WIDTH, self.view.frame.size.height)];
    [self.view addSubview:table];
    
//    NLXLineView *lineView = [[NLXLineView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 300)];
//    [self.view addSubview:lineView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
