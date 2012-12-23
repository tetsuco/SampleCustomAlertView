//
//  ViewController.m
//  SampleCustomAlertView
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ボタン1
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(0.0, 0.0, 180.0, 30.0);
    btn1.center = CGPointMake(self.view.frame.size.width / 2, 100.0);
    btn1.tag   = 1;
    [btn1 setTitle:@"アラート" forState:UIControlStateNormal];  // 有効時
    [btn1 addTarget:self action:@selector(btnAction:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    // ボタン2
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(btn1.frame.origin.x, btn1.frame.origin.y + btn1.frame.size.height + 30, btn1.frame.size.width, btn1.frame.size.height);
    btn2.tag   = 2;
    [btn2 setTitle:@"カスタムアラート" forState:UIControlStateNormal];  // 有効時
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


/* ============================================================================== */
#pragma mark - Button Action
/* ============================================================================== */
- (void)btnAction:(UIButton*)sender
{
    /* アラート表示 */
    
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.delegate = self;
    
    if (sender.tag == 1) {
        alert.title = @"アラート";            // タイトル
        alert.tag = 1;                      // タグ
    } else {
        alert.title = @"カスタムアラート";     // タイトル
        alert.tag = 2;                      // タグ
    }
    
    alert.message = @"アラートです。アラートです。アラートです。";
    [alert addButtonWithTitle:@"いいえ"];
    [alert addButtonWithTitle:@"はい"];
    [alert show];
}


/* ============================================================================== */
#pragma mark - Alert Custom
/* ============================================================================== */
// アラートが表示される前に呼び出される
- (void)willPresentAlertView:(UIAlertView *)alertView
{
    // カスタムアラートの場合
    if (alertView.tag == 2)
    {
        // アラートの表示サイズを設定
        CGRect alertFrame = CGRectMake(0, 0, 400, 162);
        alertView.frame = alertFrame;
        
        // アラートの表示位置を設定(アラート表示サイズを変更すると位置がずれるため)
        CGPoint alertPoint = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
        alertView.center = alertPoint;
        
        
        // 変数初期化
        NSInteger uiLabelNum = 0;      // ラベル表示回数カウント用
        NSInteger uiButtonNum = 0;     // ボタン表示回数カウント用
        
        // アラート上のオブジェクトの位置を修正(アラート表示サイズを変更すると位置がずれるため)
        for (UIView* view in alertView.subviews) {
            NSLog(@"view = %@", view);
            
            // ラベル
            if ([view isKindOfClass:NSClassFromString(@"UILabel")])
            {
                // ラベルのサイズを設定
                view.frame = CGRectMake(0, 0, 370, 43);
                
                /* 表示位置設定 */
                
                // タイトル
                if (uiLabelNum == 0)
                {
                    view.center = CGPointMake(alertView.frame.size.width / 2.0, 23);
                }
                // メッセージ
                else
                {
                    view.center = CGPointMake(alertView.frame.size.width / 2.0, 61);
                }
                
                uiLabelNum++;  // インクリメント
            }
            
            // ボタン
            if ([view isKindOfClass:NSClassFromString(@"UIThreePartButton")] ||     // iOS4用
                [view isKindOfClass:NSClassFromString(@"UIAlertButton")])           // iOS5用
            {
                // ボタンのサイズを設定
                view.frame = CGRectMake(0, 0, 127, 43);
                
                /* 表示位置設定 */
                
                // 「いいえ」ボタン
                if (uiButtonNum == 0)
                {
                    view.center = CGPointMake(alertView.frame.size.width / 2.0 - 67, 122);
                }
                // 「はい」ボタン
                else
                {
                    view.center = CGPointMake(alertView.frame.size.width / 2.0 + 67, 122);
                }
                
                uiButtonNum++;  // インクリメント
            }
        }
    }
}


/* ============================================================================== */
#pragma mark - Alert Action
/* ============================================================================== */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 「いいえ」ボタン
	if (buttonIndex == 1)
    {
        //
    }
    // 「はい」ボタン
    else
    {
        //
    }
}


@end
