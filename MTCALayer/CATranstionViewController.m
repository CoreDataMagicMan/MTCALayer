//
//  CATranstionViewController.m
//  MTCALayer
//
//  Created by mtt0150 on 15/9/4.
//  Copyright (c) 2015年 MT. All rights reserved.
//

#import "CATranstionViewController.h"

@interface CATranstionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) CATransition *transition;
@end

@implementation CATranstionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index = 1;
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",self.index] inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
    
    
}
//初始化CATransition
- (CATransition *)transition{
    if (!_transition) {
        _transition = [CATransition animation];
    }
    return _transition;
}
//下一张
- (IBAction)nextImage:(UIButton *)sender {
    self.index++;
    if (self.index > 6) {
        //如果是最后一张，那么就从首张再开始
        self.index = 1;
        
    }
    //执行转场的动画
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",self.index] inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
    self.transition.type = @"cube";
    _transition.subtype = kCATransitionFromBottom;
    _transition.duration = 3;
    _transition.startProgress = 0;
    _transition.endProgress = 1;
    [self.iconImageView.layer addAnimation:_transition forKey:nil];
}

//上一张
- (IBAction)forwardImage:(UIButton *)sender {
    self.index--;
    if (self.index < 1) {
        self.index = 6;
    }
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",self.index] inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
    self.transition.type = @"cube";
    _transition.subtype = kCATransitionFromTop;
    _transition.duration = 0.5;
    [self.iconImageView.layer addAnimation:_transition forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
