//
//  ViewController.m
//  test_分屏
//
//  Created by Fu_sion on 16/4/16.
//  Copyright © 2016年 Fu_sion. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textViewA;
@property (weak, nonatomic) IBOutlet UITextView *textViewB;
@property (weak, nonatomic) IBOutlet UIView *cutScreenView;
@property (weak, nonatomic) IBOutlet UIView *cutScreenViewB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewAAndBHeigth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewAHeigh;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewAwith;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self cutScreenA];
    [self cutScreenB];
}
-(void)cutScreenB{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(cupScreen:)];
     [self.cutScreenViewB addGestureRecognizer:pan];
}
- (void)cutScreenA{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(cupScreen:)];
    [self.cutScreenView addGestureRecognizer:pan];
   
}
-(void)cupScreen:(UIPanGestureRecognizer*)sender{
    CGPoint point = [sender locationInView:self.view];
    CGFloat screenHeigth = self.view.frame.size.height;
    CGFloat mu = self.viewAAndBHeigth.multiplier;
    CGFloat mutiplier = (screenHeigth - point.y) / point.y;
    NSLog(@"%f ,%f ",mutiplier,mu);

    self.viewAHeigh.constant = point.y;
    self.viewAwith.constant = point.x;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
