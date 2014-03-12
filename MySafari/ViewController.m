//
//  ViewController.m
//  MySafari
//
//  Created by Jaime Hernandez on 3/12/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UIWebView *myWebView;
    
}
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIWebView   *myWebView;

- (IBAction)onBackButtonPressed:(id)sender;
- (IBAction)onForwardButton:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *appendHTTPer =@"HTTP://";
    appendHTTPer = [appendHTTPer stringByAppendingString:textField.text];
    NSString *completAddress = appendHTTPer;
    NSURL *urlString = [NSURL URLWithString:completAddress];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:urlString];
    
    [self.myWebView loadRequest:request];
    
    return YES;
}

- (IBAction)onBackButtonPressed:(id)sender {
    
    [self.myWebView goBack];
    
}

- (IBAction)onForwardButton:(id)sender {
   
    [self.myWebView goForward];
}
@end
