//
//  ViewController.m
//  BackgroundDownloadDemo
//
//  Created by HK on 16/9/10.
//  Copyright © 2016年 hkhust. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#define URL @"http://192.168.1.104:8800/data/UsbDisk1/Volume1/TDDOWNLOAD/%5b%e8%bf%85%e9%9b%b7%e4%b8%8b%e8%bd%bdwww.DYmp4.com%5d%e7%81%ab%e5%bd%b1%e5%bf%8d%e8%80%85673.mp4"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIProgressView *downloadProgress;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateDownloadProgress:) name:kDownloadProgressNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateDownloadProgress:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CGFloat fProgress = [userInfo[@"progress"] floatValue];
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%",fProgress * 100];
    self.downloadProgress.progress = fProgress;
}

#pragma mark Method
- (IBAction)download:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//    [delegate beginDownloadWithUrl:@"http://sw.bos.baidu.com/sw-search-sp/software/797b4439e2551/QQ_mac_5.0.2.dmg"];
    [delegate beginDownloadWithUrl:URL];
}

- (IBAction)pauseDownlaod:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate pauseDownload];
}

- (IBAction)continueDownlaod:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate continueDownloadWithUrl:URL];
}

@end
