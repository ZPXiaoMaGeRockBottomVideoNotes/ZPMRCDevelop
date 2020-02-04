//
//  ViewController.m
//  MRC开发
//
//  Created by 赵鹏 on 2019/8/16.
//  Copyright © 2019 赵鹏. All rights reserved.
//

/**
 为了营造MRC环境，先要在TARGETS中的Build Settings中把ARC由YES改为NO。
 */
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableArray *data;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *data = [[NSMutableArray alloc] init];  //调用了alloc方法，所以data对象的引用计数为1
    self.data = data;  //在赋值给data属性的时候，调用了set方法，在set方法里面把data对象retain了一次，这样data的引用计数就变为了2了
    [data release];  //data引用计数为1，前面调用了alloc方法，后面就应该调用release方法
    
    //这句代码相当于上面的三句代码
//    self.data = [[[NSMutableArray alloc] init] autorelease];
    
    /**
     这句代码也相当于上面的三句代码；
     一般通过类方法创建的对象，它的内部已经调用了一次autorelease方法了。
     */
    self.data = [NSMutableArray array];
}

- (void)dealloc
{
    self.data = nil;  //data对象的引用计数为0，所以将data对象释放掉
    
    [super dealloc];
}

@end
