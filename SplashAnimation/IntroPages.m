//
//  AppDelegate.h
//  SplashAnimation
//
//  Created by Apple on 30/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "IntroPages.h"
#import  <QuartzCore/QuartzCore.h>

@interface IntroPages ()
{
  UIView *bgView;
}
@end

@implementation IntroPages

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationController.navigationBarHidden = YES;
  
  bgView = [[UIView alloc]init];
  bgView.frame = self.view.bounds;
  [bgView setBackgroundColor:[UIColor colorWithRed:231/255.0f green:95/255.0f blue:38/255.0f alpha:1.0f]];
  [self.view addSubview:bgView];
  
  [self secondLogo];
  [self firstLogo];
 
}
-(void)firstLogo {
  UIImageView *imgLineup = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-40, 200, 75)];
  // imgLineup.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
  imgLineup.image = [UIImage imageNamed:@"dinner"];
  [bgView addSubview:imgLineup];
  [UIView animateWithDuration:1.0
                        delay:1
                      options:UIViewAnimationOptionCurveLinear animations:^{
                        [imgLineup setFrame:CGRectMake(self.view.frame.size.width/2-100, -(self.view.frame.size.height/2-40), 200,75)];
                      }
                   completion:^(BOOL finished){
                     
                   }];
}
-(void) secondLogo {
  UIImageView *imgLineup = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2+40, 200, 75)];
  // imgLineup.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
  imgLineup.image = [UIImage imageNamed:@"cutlery"];
  [bgView addSubview:imgLineup];
  [UIView animateWithDuration:1.0
                        delay:1
                      options:UIViewAnimationOptionCurveLinear animations:^{
                        [imgLineup setFrame:CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height+40, 200,75)];
                      }
                   completion:^(BOOL finished){
                     [UIView transitionWithView:self->bgView duration:0.5 options:UIViewAnimationOptionTransitionNone animations:^{
                       [self->bgView setBackgroundColor:[UIColor whiteColor]];
                     }completion:^(BOOL finished) {
                       [self callDriver];
                     }];
                   }];
}

//Scooter image
-(void) callDriver {
  UIImageView *imgLineup = [[UIImageView alloc]initWithFrame:CGRectMake(-100, self.view.frame.size.height/2-75, 150, 130)];
  // imgLineup.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
  imgLineup.image = [UIImage imageNamed:@"delivery"];
  [self.view addSubview:imgLineup];
  [UIView animateWithDuration:0.5
                        delay:0.0
                      options:UIViewAnimationOptionCurveLinear animations:^{
                        [imgLineup setFrame:CGRectMake(self.view.frame.size.width/2-65, self.view.frame.size.height/2-75, 150,130)];
                      }
                   completion:^(BOOL finished){
                     [self didCallLogoImage];
                   }];
}

//Logo image
-(void)didCallLogoImage {
  UIImageView *imgLineup = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-75, self.view.frame.size.height/2+50, 150, 100)];
  imgLineup.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
  imgLineup.image = [UIImage imageNamed:@"vegetables"];
  [self.view addSubview:imgLineup];
  
  [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     imgLineup.layer.anchorPoint = CGPointMake(0.5, 0.5);
                     imgLineup.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                   }
                   completion:^(BOOL finished) {
                     NSLog(@"done");
                     [self performSelector:@selector(moveToPageViewController) withObject:nil afterDelay:2.0];
                   }];
}

-(void)moveToPageViewController {
    
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
