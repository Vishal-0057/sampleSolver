//
//  ViewController.m
//  sampleSolver
//
//  Created by abhayam rastogi on 4/21/15.
//  Copyright (c) 2015 Itelligrape. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self maxProfit:@[[NSNumber numberWithInt:200],[NSNumber numberWithInt:280],[NSNumber numberWithInt:360],[NSNumber numberWithInt:410],[NSNumber numberWithInt:795],[NSNumber numberWithInt:140],[NSNumber numberWithInt:635]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (int) maxProfit:(NSArray *)ary {
    NSNumber *maxNum =  [ary valueForKeyPath:@"@max.intValue"];
    NSInteger index = [ary indexOfObject:maxNum];
    __block NSNumber *minNum = nil;
    [ary enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx == index-1) {
            *stop = YES;
            if ([minNum intValue] > [(NSNumber *)obj intValue]) {
                minNum = obj;
            }
        } else if (!minNum) {
            minNum = obj;
        } else if ([minNum intValue] > [(NSNumber *)obj intValue]) {
            minNum = obj;
        }
        
    }];
    
    NSLog(@"MaxNum :%@ MinNum : %@",maxNum, minNum);
    return [maxNum intValue] - [minNum intValue];
}

@end
