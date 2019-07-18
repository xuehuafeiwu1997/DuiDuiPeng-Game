//
//  ViewController.m
//  视频播放
//
//  Created by 许明洋 on 2019/7/17.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
@interface ViewController ()
@property(nonatomic,strong)NSString *videoUrl;
@property(nonatomic,strong)AVPlayerViewController *playerVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.videoUrl=@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    self.playerVC=[[AVPlayerViewController alloc]init];
    self.playerVC.player=[AVPlayer playerWithURL:[self.videoUrl hasPrefix:@"http"]?[NSURL URLWithString:self.videoUrl]:[NSURL fileURLWithPath:self.videoUrl]];
    self.playerVC.view.frame=self.view.bounds;
    self.playerVC.showsPlaybackControls=YES;
    //开启这个播放时支持横竖屏
    self.playerVC.entersFullScreenWhenPlaybackBegins=YES;
    //开启这个所有item播放完毕可以退出全屏
    self.playerVC.exitsFullScreenWhenPlaybackEnds=YES;
    [self.view addSubview:self.playerVC.view];
    if(self.playerVC.readyForDisplay){
        [self.playerVC.player play];
    }
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    //第一种播放方法未成功
//    /*
//    //创建一个字符串对象，保存视频的网络地址
//    NSString *strURL=@"https://www.bilibili.com/video/av58207080?from=search&seid=9004757112959912021";
//    //将字符串转化为网址连接
//    NSURL *url=[NSURL URLWithString:strURL];
//    //创建一个视图播放器
//    //P1:通过一个有效的网络视频地址作为参数
//    _playerController=[[MPMoviePlayerController alloc]initWithContentURL:url];
//    NSLog(@"url=%@",url);
//    //将视频播放器的大小赋值
//    _playerController.view.frame=CGRectMake(100, 100, 180, 240);
//    //视频下载后处理编解码的过程
//    [_playerController prepareToPlay];
//    //[_playerController play];
//    //将播放器视图添加到当前视图上
//    [self.view addSubview:_playerController.view];
//    */
//
//    //第二种播放方法
//    //创建一个字符串对象，保存视频的网络地址
//    NSString *strURL=@"https://www.bilibili.com/video/av58207080?from=search&seid=9004757112959912021";
//    //将字符串转化为网址连接
//    NSURL *url=[NSURL URLWithString:strURL];
//    _playerView=[[AVPlayerViewController alloc]init];
//
//    _playerView.view.frame=self.view.bounds;
//    [self.view addSubview:_playerView];
//}

@end
