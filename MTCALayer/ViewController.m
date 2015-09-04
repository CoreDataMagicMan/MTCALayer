//
//  ViewController.m
//  MTCALayer
//
//  Created by mtt0150 on 15/9/3.
//  Copyright (c) 2015年 MT. All rights reserved.
//

#import "ViewController.h"
//这里需要注意的是想要除以得到一个小数，必须有一个数是float型数据才行，不然系统会默认将小数点后面的位数去掉
#define angleRadom(angle) ((angle / 180)* M_PI)
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicAnimation];
    _iconImage.layer.borderWidth = 2;
    _iconImage.layer.borderColor = [UIColor brownColor].CGColor;
    _iconImage.layer.cornerRadius = 40;
    _iconImage.layer.masksToBounds = YES;
    _iconImage.layer.contents = (id)[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"头像1.png" ofType:nil]].CGImage;
    
}
- (void)basicAnimation{
    CALayer *myLayer = [CALayer layer];
    myLayer.backgroundColor = [UIColor blackColor].CGColor;
    myLayer.bounds = CGRectMake(0, 0, 50, 50);
    myLayer.position = CGPointMake(100, 100);
    myLayer.anchorPoint = CGPointMake(0, 0);
    myLayer.cornerRadius = 25;
    [self.view.layer addSublayer:myLayer];
    self.layer = myLayer;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    //创建一个基础动画
//    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    basicAnimation.duration = 3.0f;
//    basicAnimation.repeatCount = 2;
//    basicAnimation.autoreverses = YES;
//    basicAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(200, 200, 200)];
//    basicAnimation.removedOnCompletion = NO;
//    basicAnimation.fillMode = kCAFillModeForwards;
//    basicAnimation.delegate = self;
//    NSString *positionStr = NSStringFromCGPoint(self.layer.position);
//    NSLog(@"开始前:%@",positionStr);
//    //给这个basic动画效果选定一个对象者，即指定一个对象让这个对象去执行你设置的动画
//    [self.layer addAnimation:basicAnimation forKey:nil];
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    keyframeAnimation.keyPath = @"position";
    NSArray *values = @[[NSValue valueWithCGPoint:CGPointMake(100, 100)],
                        [NSValue valueWithCGPoint:CGPointMake(200, 100)],
                        [NSValue valueWithCGPoint:CGPointMake(200, 200)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 200)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 100)]
                        ];
    keyframeAnimation.values = values;
    keyframeAnimation.keyTimes = @[@0.1,
                                   @0.2,
                                   @0.3,
                                   @0.4,
                                   @0.5
                                   ];
    //在这里尝试添加path路径，当你设置了path路径，那么会将values的设置效果去掉
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
//    keyframeAnimation.path = path;
//    CGPathRelease(path);
    keyframeAnimation.removedOnCompletion = NO;
    keyframeAnimation.fillMode = kCAFillModeForwards;
    keyframeAnimation.duration = 4.0f;
    keyframeAnimation.repeatCount = 2;
    keyframeAnimation.delegate = self;
    //keyframeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:keyframeAnimation forKey:@"positionMove"];
    //这里实现一个头像抖动的功能，用关键帧动画来实现角度的摇摆,注意，最好是对同一个keypath进行设置values的值，比如你要对一个旋转添加一个value值，而这个值是一个平移的特性，虽然执行起来没什么错误（奇怪的事还是能够执行的现象的），但是最好还是对同一个属性设置values值
//    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
//    keyFrameAnimation.keyPath = @"transform.rotation";
//    NSArray *values = @[@(-angleRadom(8.0)),
//                        @(angleRadom(8.0)),
//                        @(-angleRadom(8.0))
//                        ];
//    keyFrameAnimation.values = values;
//    keyFrameAnimation.duration = 0.1;
//    keyFrameAnimation.beginTime = 1;
//    keyFrameAnimation.repeatCount = MAXFLOAT;
//    keyFrameAnimation.removedOnCompletion = YES;
//    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
//    basicAnimation.keyPath = @"transform.translation.y";
//    basicAnimation.toValue = @300;
//    basicAnimation.duration = 2.0;
//    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    basicAnimation1.toValue = @(0.5);
//    //可以发现，一个动画组中animations中的成员的动画效果是同时执行的，也就是说如果我给这个组动画设的动画时间是2秒，那么每个动画成员的执行动画时间都是2秒，他们并不是共同分享这两秒，而是独自拥有这2秒的执行时间，子动画和动画组的动画持续时间duration之间是会互相影响的。
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.animations = @[keyFrameAnimation,
//                         basicAnimation,
//                         basicAnimation1
//                         ];
//    group.duration = 2.0;
//    //group.removedOnCompletion = NO;
//    //group.fillMode = kCAFillModeForwards;
//    group.delegate = self;
//    [self.iconImage.layer addAnimation:group forKey:@"dong"];
    //在这里使用UIview封装的动画block,uiview封装的动画效果的代码块都是类方法
//    [UIView transitionWithView:self.iconImage duration:3.0 options:0 animations:^{
//        //注意，设置动画重复次数或者其他动画属性时要在执行动画效果之前设定，否则会没有效果
//        [UIView setAnimationRepeatCount:3];
//        [UIView setAnimationRepeatAutoreverses:YES];
//        self.iconImage.center = CGPointMake(200, 200);
//        
//        
//    } completion:^(BOOL finished) {
//        if (finished) {
//            //view的属性值确实被改变了，这是和calayer最大的区别之处
//            NSLog(@"%@",NSStringFromCGPoint(self.iconImage.center));
//        }
//    }];
    
    
}
//- (void)animationDidStart:(CAAnimation *)anim{
//    NSLog(@"动画开始了");
//}
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    if (flag) {
//        NSLog(@"动画结束了");
//        NSString *positionStr = NSStringFromCGPoint(self.layer.position);
//        //可以这个calayer虽然在不断的变化，但是layer层的属性却不会因此而改变
//        NSLog(@"结束以后:%@",positionStr);
//        CAAnimationGroup *group = (CAAnimationGroup *)anim;
//        NSArray *tempArray = group.animations;
//        CAKeyframeAnimation *keyAnimation = tempArray[0];
//        double pertime = keyAnimation.duration;
//        NSLog(@"动画组:%@",tempArray);
//        NSLog(@"执行的次数:%f",group.duration / pertime);
//    }
//    
//}
- (IBAction)stop:(id)sender {
    
    [self.iconImage.layer removeAnimationForKey:@"dong"];
}

@end
