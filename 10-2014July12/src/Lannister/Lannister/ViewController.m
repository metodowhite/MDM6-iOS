//
//  ViewController.m
//  Lannister
//
//  Created by metodowhite on 05/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic) NSURL *url;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadURL:(id)sender {
    NSString *urlText = self.urlField.text;
    
    if (![urlText hasPrefix:@"http://"] && ![urlText hasPrefix:@"https://"]) {
        if (![urlText hasPrefix:@"//"] ) {
            urlText = [@"//" stringByAppendingString:urlText];
            urlText = [@"http:" stringByAppendingString:urlText];
        }
    }
    
    self.url = [NSURL URLWithString:urlText];
    [self.webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

- (IBAction)share:(id)sender {
     UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[_url] applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}

@end




















