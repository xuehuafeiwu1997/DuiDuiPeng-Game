//
//  ViewController.m
//  NSOperation的使用
//
//  Created by 许明洋 on 2019/7/17.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for(int i=0;i<2;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(100, 100+80*i, 160, 80);
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=101+i;
        if(i==0){
            [btn setTitle:@"添加新任务1到队列中" forState:UIControlStateNormal];
        }
        else if(i==1){
            [btn setTitle:@"添加新任务2到队列中" forState:UIControlStateNormal];
        }
        [self.view addSubview:btn];
    }
    //创建一个任务队列对象
    _queue=[[NSOperationQueue alloc]init];
    //设置最大任务并发数量
    [_queue setMaxConcurrentOperationCount:5];
}
-(void)pressBtn:(UIButton *)btn
{
    if(btn.tag==101){
        //方法一：将任务添加到队列中
        //创建一个任务
        //p1:任务函数的拥有者
        //p2:任务函数执行体
        //p3:任意参数
        NSInvocationOperation *opt=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(optAct:) object:@"OPT01"];
        [_queue addOperation:opt];
        //方法二：将任务添加到队列中
        NSInvocation *invo=[[NSInvocation alloc]init];
        
        invo.target=self;
        invo.selector=@selector(optAct:);
        NSInvocationOperation *opt02=[[NSInvocationOperation alloc]initWithInvocation:invo];
        [_queue addOperation:opt02];
    }
    else if(btn.tag==102)
    {
        //方法三：使用Block来进行任务处理
        //这里面添加一个无线循环不会死机，因为block语法块是单独开辟出来执行的
        [_queue addOperationWithBlock:^{
            while(true){
                NSLog(@"block");
            }
        }];
    }
}
-(void)optAct:(NSInvocationOperation *)opt
{
    while(true)
    {
        NSLog(@"opt 01");
    }
}

@end
