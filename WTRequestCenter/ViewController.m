//
//  ViewController.m
//  WTRequestCenter
//
//  Created by song on 14-7-19.
//  Copyright (c) 2014年 song. All rights reserved.
//

#import "ViewController.h"
#import "WTRequestCenter.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self get];
    return;
//    NSUInteger usage = [WTRequestCenter currentDiskUsage];
//    NSLog(@"%u",usage);
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURL *imageURL = [NSURL URLWithString:[@"http://img0.bdstatic.com/img/image/百度0529.jpg" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:imageView];
    [WTRequestCenter getImageWithURL:imageURL imageComplectionHandler:nil];
    /*
    [WTRequestCenter getImageWithURL:url imageComplectionHandler:^(UIImage *image) {
        
        imageView.image = image;
        
    }];
    */
    return;

    
//    缓存用量
//    usage = [WTRequestCenter currentDiskUsage];
//    NSLog(@"%u",usage);
    
//    -------post request--------
   
    for (int i=0; i<10; i++) {
        [WTRequestCenter getImageWithURL:url imageComplectionHandler:NULL];
        
        [WTRequestCenter getWithURL:url
                  completionHandler:^(NSURLResponse *response, NSData *data,NSError *error) {
                      NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                      NSLog(@"%@",string);
                  }];
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:@"1" forKey:@"a"];
        [dict setValue:@"2" forKey:@"b"];
        [dict setValue:@"3" forKey:@"c"];
        
        [WTRequestCenter postWithURL:url parameters:dict completionHandler:NULL];
        /*
        [WTRequestCenter postWithURL:url parameters:dict completionHandler:^(NSURLResponse *response, NSData *data,NSError *error) {
            
        }];
*/
    }
}



-(void)get
{
    NSURL *imageURL = [NSURL URLWithString:[@"http://img0.bdstatic.com/img/image/百度0529.jpg" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:@"http://mapi.v1baobao.com/user/user_login"];
    NSDictionary *parameters = @{@"username": @"321321",@"password":@"111111"};
    for (int i=0; i<1; i++) {
//        [WTRequestCenter getImageWithURL:url imageComplectionHandler:NULL];
        
        [WTRequestCenter postWithURL:url parameters:parameters completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSLog(@"%@",dict);
        }];
        return;
        [WTRequestCenter getImageWithURL:imageURL imageComplectionHandler:^(UIImage *image) {
            NSLog(@"%@",image);
        }];
//        [WTRequestCenter getWithURL:url completionHandler:NULL];
        [WTRequestCenter getWithURL:url completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//            dasdasd
//            NSLog(@"%@",response);
        }];
        
      /*
        [WTRequestCenter getWithURL:imageURL
                  completionHandler:^(NSURLResponse *response, NSData *data,NSError *error) {
                      NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                      NSLog(@"%@",string);
                  }];
       */
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
