//
//  ViewController.m
//  对对碰游戏
//
//  Created by 许明洋 on 2019/7/19.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)startGame{
    
    NSMutableArray *arrStr=[[NSMutableArray alloc]init];
    for (int k=0; k<18; k++) {
        int random=arc4random()%15+1;
        NSString *strName=[NSString stringWithFormat:@"%d.jpg",random];
        //将其添加到数组中
        [arrStr addObject:strName];
        [arrStr addObject:strName];
    }
    
    //创建36个按钮
    for (int i=0; i<6; i++) {
        for (int j=0; j<6; j++) {
            
            //创建自定义的按钮
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            
            //添加一个简单动画
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:3];
            
           // btn.frame=CGRectMake(10+50*j, 40+50*i, 50, 50);
            float m=self.view.bounds.size.width;
            float n=self.view.bounds.size.height-self.navigationController.navigationBar.frame.size.height;
            btn.frame=CGRectMake(0+m/6*(j%6), 0+i*n/6, m/6, n/6);
            
            [UIView commitAnimations];
            //产生随机数
            int indexRandom=arc4random()%arrStr.count;
            NSString *strImage=arrStr[indexRandom];
            NSInteger tag=[strImage integerValue];
            
            //从数组中取出之后要将其清除
            [arrStr removeObjectAtIndex:indexRandom];
            UIImage *image=[UIImage imageNamed:strImage];
            
            [btn setImage:image forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:btn];
            
            //为每个按钮的标志位赋值，使图片相同的按钮标志位相同
            btn.tag=tag;
        }
    }
    self.view.backgroundColor=[UIColor yellowColor];
}

//当按钮按下后触发该事件
-(void)pressBtn:(UIButton *)btn{
    //创建一个静态变量，用于保存第一次按下的按钮
    static UIButton *btnFirst=nil;
    if(btnFirst==nil){
        btnFirst=btn;
        //将第一个按钮锁定
        btnFirst.enabled=NO;
    }
    else{
        if (btnFirst.tag==btn.tag){
            btnFirst.hidden=YES;
            btn.hidden=YES;
            btnFirst=nil;
        }
        else{
            btnFirst.enabled=YES;
            btnFirst=nil;
            
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startGame];
}


@end
