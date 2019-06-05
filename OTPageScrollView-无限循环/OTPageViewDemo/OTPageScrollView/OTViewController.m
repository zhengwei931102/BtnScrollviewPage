//
//  OTViewController.m
//  OTPageScrollView
//
//  Created by akron on 7/22/14.
//  Copyright (c) 2014 Oolong Tea. All rights reserved.
//

#import "OTViewController.h"
#import "OTPageScrollView.h"
#import "OTPageView.h"

@interface OTViewController ()<OTPageScrollViewDataSource,OTPageScrollViewDelegate>

@end

@implementation OTViewController{
    NSArray *_dataArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    OTPageView *PScrollView = [[OTPageView alloc] initWithFrame:CGRectMake(0, 50, [[UIScreen mainScreen] bounds].size.width, 200)];
    PScrollView.pageScrollView.dataSource = self;
    PScrollView.pageScrollView.delegate = self;
    PScrollView.pageScrollView.padding =30;
    PScrollView.pageScrollView.leftRightOffset = 0;
    PScrollView.pageScrollView.frame = CGRectMake(0,50, PScrollView.pageScrollView.padding+50, 50);
    PScrollView.pageScrollView.backgroundColor = [UIColor yellowColor];

    PScrollView.backgroundColor = [UIColor redColor];
    _dataArray = [NSArray arrayWithObjects:
                          @"0",
                          @"1",
                          @"2",
                          @"3",
                          @"4",
                          nil];
     [PScrollView.pageScrollView reloadData];
     [self.view addSubview:PScrollView];
}

- (NSInteger)numberOfPageInPageScrollView:(OTPageScrollView*)pageScrollView{
    return [_dataArray count];
}

- (UIView*)pageScrollView:(OTPageScrollView*)pageScrollView viewForRowAtIndex:(int)index{
    UIView *cell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    cell.layer.cornerRadius = 25;
    cell.layer.masksToBounds= YES;
    cell.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width-20, cell.frame.size.height - 20)];
    label.text = _dataArray[index];
    [cell addSubview:label];
    return cell;
}

- (CGSize)sizeCellForPageScrollView:(OTPageScrollView*)pageScrollView
{
    return CGSizeMake(50, 50);
}

- (void)pageScrollView:(OTPageScrollView *)pageScrollView didTapPageAtIndex:(NSInteger)index{

    NSLog(@"click cell at %ld",index);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = (NSInteger)(scrollView.contentOffset.x / scrollView.frame.size.width) % _dataArray.count;
    scrollView.contentOffset =  CGPointMake((_dataArray.count*2+index)*scrollView.frame.size.width, 0);

    
    //第一个放大
//    UIView *circleview = scrollView.subviews[index];
//    [UIView animateWithDuration:0.1f animations:^{
//        circleview.transform = CGAffineTransformMakeScale(1.2, 1.2);
//    } completion:^(BOOL finished) {
//        for (UIView *view in scrollView.subviews) {
//            if(view!=circleview){
//                view.transform = CGAffineTransformIdentity;
//            }
//        }
//    }];
    
    NSLog(@"click cell at %ld",index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
