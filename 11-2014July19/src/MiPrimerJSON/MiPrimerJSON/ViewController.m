//
//  ViewController.m
//  MiPrimerJSON
//
//  Created by metodowhite on 19/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSData *jsonData;
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

- (IBAction)loadRemoteJSON:(id)sender {
    // NSString *urlAsString = @"http://www.apple.com";
    // NSString *urlAsString = @"http://www.last.fm/robots.txt";
    NSString *urlAsString = @"http://graph.facebook.com/remco.visser.94";
    
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection
     sendAsynchronousRequest:urlRequest
     queue:queue
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
         if ([data length] > 0 && connectionError == nil) {
             
             self.jsonData = data;
             
             NSString *dataToString = [[NSString alloc] initWithData:data
                                                            encoding:NSUTF8StringEncoding];
             
             NSFileManager *fileManager = [[NSFileManager alloc] init];
             NSURL *documentsFolderUrl = [fileManager URLForDirectory:NSDocumentDirectory
                                                             inDomain:NSUserDomainMask
                                                    appropriateForURL:nil
                                                               create:NO
                                                                error:nil];
             
             NSURL *filePath = [documentsFolderUrl URLByAppendingPathComponent:@"leData.json"];
             [data writeToURL:filePath atomically:YES];
             
             NSLog(@"%@", dataToString);
         }
     }];
}


- (IBAction)serializeJSON:(id)sender {
    
    NSDictionary *dictionary = @{
                                 @"First Name" : @"Paco",
                                 @"Last Name"  : @"Marchena",
                                 @"Age"        : @31,
                                 @"Mascotas"   : @[@"Curra", @"Sofi", @"Galga", @"Paca"]
                                 };
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil) {
        // NSLog(@"%@", jsonData);
        NSLog(@"%@", [[NSString alloc] initWithData:jsonData
                                           encoding:NSUTF8StringEncoding]);
    }
}

- (IBAction)deSerializeJSON:(id)sender {
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:_jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *deSerializedDictionary = jsonObject;
        NSLog(@"%@", deSerializedDictionary);
        // NSLog(@"%@", deSerializedDictionary[@"name"]);

    } else if ([jsonObject isKindOfClass:[NSArray class]]) {

        NSArray *deSerializedArray= jsonObject;
        NSLog(@"%@", deSerializedArray);

    }
}

@end


























